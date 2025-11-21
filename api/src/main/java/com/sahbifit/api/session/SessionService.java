package com.sahbifit.api.session;

import java.time.OffsetDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.context.ApplicationEventPublisher;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sahbifit.api.exception.ResourceNotFoundException;
import com.sahbifit.api.gym.model.Gym;
import com.sahbifit.api.gym.repository.GymRepository;
import com.sahbifit.api.session.dto.CreateSessionDto;
import com.sahbifit.api.session.dto.MarkAttendanceDto;
import com.sahbifit.api.session.dto.SessionFeedDto;
import com.sahbifit.api.session.dto.SessionParticipantDto;
import com.sahbifit.api.session.model.ParticipantStatus;
import com.sahbifit.api.session.model.Session;
import com.sahbifit.api.session.model.SessionParticipant;
import com.sahbifit.api.session.model.SessionParticipantId;
import com.sahbifit.api.session.model.SessionStatus;
import com.sahbifit.api.session.model.SessionType;
import com.sahbifit.api.session.repository.SessionParticipantRepository;
import com.sahbifit.api.session.repository.SessionRepository;
import com.sahbifit.api.user.UserService;
import com.sahbifit.api.user.model.ProfileVisibility;
import com.sahbifit.api.user.model.User;
import com.sahbifit.api.user.model.UserRole;
import com.sahbifit.api.user.repository.UserBlockRepository;
import com.sahbifit.api.user.repository.UserRepository;
import com.sahbifit.api.verification.model.VerificationStatus;
import com.sahbifit.api.verification.model.VerifiedGender;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional
public class SessionService {

    private final SessionRepository sessionRepository;
    private final UserRepository userRepository;
    private final GymRepository gymRepository;
    private final SessionParticipantRepository sessionParticipantRepository;
    private final UserService userService;
    private final ApplicationEventPublisher eventPublisher;
    private final UserBlockRepository userBlockRepository;

    // Create Session Logic
    public SessionFeedDto createSession(CreateSessionDto dto, String userPhoneNumber) {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", userPhoneNumber));

        if (user.getVerificationStatus() != VerificationStatus.verified) {
            throw new IllegalStateException("You must be fully verified to create a session.");
        }

        if (dto.sessionType() == SessionType.one_on_one && user.getGroupSessionCount() < 1) {
            throw new IllegalStateException("You must attend 1 group session before creating a 1-on-1 session.");
        }

        Gym gym = gymRepository.findById(dto.gymId())
                .orElseThrow(() -> new ResourceNotFoundException("Gym", "gymId", dto.gymId()));

        Session session = new Session();
        session.setCreator(user);
        session.setGym(gym);
        session.setSessionType(dto.sessionType());
        session.setStatus(SessionStatus.active);
        session.setTitle(dto.title());
        session.setStartTime(dto.startTime());
        session.setEndTime(dto.endTime());
        session.setMaxParticipants(dto.maxParticipants());

        Session savedSession = sessionRepository.save(session);

        SessionParticipantId creatorId = new SessionParticipantId();
        creatorId.setSessionId(savedSession.getSessionId());
        creatorId.setUserId(user.getUserId());

        SessionParticipant creatorEntry = new SessionParticipant();
        creatorEntry.setId(creatorId);
        creatorEntry.setSession(savedSession);
        creatorEntry.setUser(user);
        creatorEntry.setStatus(ParticipantStatus.joined);
        sessionParticipantRepository.save(creatorEntry);

        try {
            eventPublisher.publishEvent(new SessionCreatedEvent(this, savedSession));
        } catch (Exception e) {
            log.error("Failed to publish SessionCreatedEvent for session {}: {}", savedSession.getSessionId(), e.getMessage());
        }

        return SessionMapper.toFeedDto(savedSession);
    }

    // Join Session Logic (With Strict Separation & HashSet Optimization)
    public void joinSession(UUID sessionId, String userPhoneNumber) {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", userPhoneNumber));
        
        Session session = sessionRepository.findById(sessionId)
                .orElseThrow(() -> new ResourceNotFoundException("Session", "sessionId", sessionId));

        if (user.getVerificationStatus() == VerificationStatus.pending_review) {
            if (session.getCreator().getRole() != UserRole.ambassador) {
                throw new IllegalStateException("Verification pending. You can only join Ambassador sessions.");
            }
        }

        if (session.getSessionType() == SessionType.one_on_one && user.getGroupSessionCount() < 1) {
            throw new IllegalStateException("You must attend 1 group session before joining a 1-on-1 session.");
        }

        // --- STRICT BLOCK LOGIC START ---
        // 1. Fetch forbidden list and convert to HashSet for O(1) lookup speed
        Set<UUID> forbiddenUserIds = new HashSet<>(userBlockRepository.findAllForbiddenUserIds(user.getUserId()));

        // 2. Check if Creator is forbidden
        if (forbiddenUserIds.contains(session.getCreator().getUserId())) {
            // Pretend session doesn't exist to maintain invisibility
            throw new ResourceNotFoundException("Session", "sessionId", sessionId); 
        }

        // 3. Check if ANY existing participant is forbidden (Strict Physical Separation)
        // We iterate through the currently joined participants
        boolean hasConflict = session.getParticipants().stream()
                .anyMatch(p -> 
                    p.getStatus() == ParticipantStatus.joined && // Only check active participants
                    forbiddenUserIds.contains(p.getUser().getUserId())
                );

        if (hasConflict) {
            // We return a generic error to prevent leaking WHO is the blocker
            throw new IllegalStateException("You cannot join this session due to a privacy conflict with an existing participant.");
        }
        // --- STRICT BLOCK LOGIC END ---

        int participantCount = sessionParticipantRepository.countBySession_SessionId(sessionId);
        if (participantCount >= session.getMaxParticipants()) {
            throw new IllegalStateException("This session is already full.");
        }

        SessionParticipantId participantId = new SessionParticipantId();
        participantId.setSessionId(sessionId);
        participantId.setUserId(user.getUserId());

        if (sessionParticipantRepository.existsById(participantId)) {
            throw new IllegalStateException("You have already joined this session.");
        }

        SessionParticipant newParticipant = new SessionParticipant();
        newParticipant.setId(participantId);
        newParticipant.setSession(session);
        newParticipant.setUser(user);
        newParticipant.setStatus(ParticipantStatus.joined);
        sessionParticipantRepository.save(newParticipant);
    }

    // Leave Session Logic
    public void leaveSession(UUID sessionId, String userPhoneNumber) {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", userPhoneNumber));
        
        Session session = sessionRepository.findById(sessionId)
                .orElseThrow(() -> new ResourceNotFoundException("Session", "sessionId", sessionId));

        SessionParticipantId participantId = new SessionParticipantId();
        participantId.setSessionId(sessionId);
        participantId.setUserId(user.getUserId());

        SessionParticipant participant = sessionParticipantRepository.findById(participantId)
                .orElseThrow(() -> new IllegalStateException("You are not in this session."));

        // Prevent leaving if session already ended
        if (OffsetDateTime.now().isAfter(session.getEndTime())) {
            throw new IllegalStateException("Cannot leave a session that has already ended.");
        }

        // Calculate cutoff time (1 hour before start)
        OffsetDateTime now = OffsetDateTime.now();
        OffsetDateTime penaltyCutoff = session.getStartTime().minusHours(1);

        if (now.isAfter(penaltyCutoff)) {
            // Case 1: Late Cancellation (< 1 hour before start)
            // We mark them as 'left' but we count the penalty.
            participant.setStatus(ParticipantStatus.left);
            sessionParticipantRepository.save(participant);

            // Apply Penalty
            userService.incrementLateCancelCount(user.getUserId());
            
            log.info("User {} late cancelled session {}. Penalty applied.", user.getUserId(), sessionId);
        } else {
            // Case 2: Safe Cancellation (> 1 hour before start)
            // We delete the entry so the spot opens up for someone else completely
            sessionParticipantRepository.delete(participant);
            log.info("User {} left session {} safely.", user.getUserId(), sessionId);
        }
    }

    @Transactional(readOnly = true)
    public List<SessionFeedDto> getActiveSessions(String userPhoneNumber, VerifiedGender genderFilter) {
        User viewer = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", userPhoneNumber));
        
        // --- BLOCK LOGIC START ---
        // Fetch all IDs that have a block relationship with the viewer
        // Convert to HashSet for O(1) lookup optimization
        Set<UUID> forbiddenUserIds = new HashSet<>(userBlockRepository.findAllForbiddenUserIds(viewer.getUserId()));
        // --- BLOCK LOGIC END ---

        List<Session> sessions;
        if (genderFilter != null) {
            if (viewer.getVerifiedGender() != genderFilter) {
                throw new AccessDeniedException("You can only filter sessions by your own verified gender.");
            }
            sessions = sessionRepository.findByStatusAndCreatorVerifiedGenderWithCreatorAndGym(SessionStatus.active, genderFilter);
        } else {
            sessions = sessionRepository.findByStatusWithCreatorAndGym(SessionStatus.active);
        }

        List<Session> visibleSessions = sessions.stream()
                .filter(session -> {
                    // 1. Check Block Logic (Invisible if creator is blocked/blocking)
                    // Optimization: .contains() on a Set is O(1)
                    if (forbiddenUserIds.contains(session.getCreator().getUserId())) {
                        return false; 
                    }
                    // 2. Existing Visibility Logic
                    return isVisible(session.getCreator(), viewer);
                })
                .collect(Collectors.toList());
        
        return SessionMapper.toFeedDtoList(visibleSessions);
    }

    @Transactional(readOnly = true)
    public SessionFeedDto getSessionById(UUID sessionId, String userPhoneNumber) {
        Session session = sessionRepository.findByIdWithCreatorAndGym(sessionId)
                .orElseThrow(() -> new ResourceNotFoundException("Session", "sessionId", sessionId)); 
        
        User viewer = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", userPhoneNumber)); 
        
        if (!isVisible(session.getCreator(), viewer)) {
            throw new ResourceNotFoundException("Session", "sessionId", sessionId); 
        }

        if (viewer.getVerificationStatus() == VerificationStatus.pending_review) {
            if (session.getCreator().getRole() != UserRole.ambassador) {
                throw new AccessDeniedException("Verification pending. You can only view Ambassador sessions."); 
            }
        }

        return SessionMapper.toFeedDto(session);
    }

    private boolean isVisible(User creator, User viewer) {
        if (creator.getProfileVisibility() == ProfileVisibility.all) {
            return true;
        }

        if (creator.getProfileVisibility() == ProfileVisibility.same_gender) {
            return creator.getVerifiedGender() != VerifiedGender.not_verified &&
                   creator.getVerifiedGender() == viewer.getVerifiedGender();
        }

        return false;
    }

    @Transactional
    public void markAttendance(MarkAttendanceDto dto, String markerPhoneNumber) {
        User markerUser = userRepository.findByPhoneNumber(markerPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", markerPhoneNumber));

        Session session = sessionRepository.findById(dto.sessionId())
                .orElseThrow(() -> new ResourceNotFoundException("Session", "sessionId", dto.sessionId()));

        boolean isCreator = session.getCreator().getUserId().equals(markerUser.getUserId());
        boolean isAdmin = markerUser.getRole() == UserRole.admin;

        if (!isCreator && !isAdmin) {
            throw new AccessDeniedException("Only the session creator or an admin can mark attendance.");
        }

        SessionParticipantId participantId = new SessionParticipantId();
        participantId.setSessionId(dto.sessionId());
        participantId.setUserId(dto.participantUserId());

        SessionParticipant participant = sessionParticipantRepository.findById(participantId)
                .orElseThrow(() -> new ResourceNotFoundException("SessionParticipant", "Id", participantId));

        participant.setStatus(dto.newStatus());
        sessionParticipantRepository.save(participant);

        if (dto.newStatus() == ParticipantStatus.no_show) {
            userService.incrementNoShowCount(dto.participantUserId());
        } 
        else if (dto.newStatus() == ParticipantStatus.attended) {
            if (session.getSessionType() == SessionType.group) {
                userService.incrementGroupSessionCount(dto.participantUserId());
            }
        }
    }

    @Transactional(readOnly = true)
    public List<SessionParticipantDto> getSessionParticipants(UUID sessionId) {
        Session session = sessionRepository.findById(sessionId)
            .orElseThrow(() -> new ResourceNotFoundException("Session", "sessionId", sessionId));
            
        return session.getParticipants().stream()
            .map(p -> new SessionParticipantDto(
                com.sahbifit.api.user.UserMapper.toSummaryDto(p.getUser()),
                p.getStatus(),
                p.getJoinedAt()
            ))
            .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<SessionFeedDto> getMySessions(String userPhoneNumber) {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", userPhoneNumber));

        List<Session> sessions = sessionRepository.findSessionsByParticipantUserId(user.getUserId());

        return SessionMapper.toFeedDtoList(sessions);
    }
}