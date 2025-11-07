package com.sahbifit.api.session;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sahbifit.api.exception.ResourceNotFoundException;
import com.sahbifit.api.external.chat.ChatService;
import com.sahbifit.api.gym.model.Gym;
import com.sahbifit.api.gym.repository.GymRepository;
import com.sahbifit.api.session.dto.CreateSessionDto;
import com.sahbifit.api.session.dto.MarkAttendanceDto;
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
import com.sahbifit.api.user.repository.UserRepository;
import com.sahbifit.api.verification.model.VerificationStatus;
import com.sahbifit.api.verification.model.VerifiedGender;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class SessionService {

    private final SessionRepository sessionRepository;
    private final UserRepository userRepository;
    private final GymRepository gymRepository;
    private final SessionParticipantRepository sessionParticipantRepository;
    private final UserService userService;
    private final ChatService chatService;

    /**
     * (Method 1) Create a new session, applying all "Create" gates.
     */
    public Session createSession(CreateSessionDto dto, String userPhoneNumber) {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));

        // Gate 1 (Verification)
        if (user.getVerificationStatus() != VerificationStatus.verified) {
            throw new IllegalStateException("You must be fully verified to create a session.");
        }

        // Gate 2 (Reputation - MVP 3.5)
        if (dto.getSessionType() == SessionType.one_on_one && user.getGroupSessionCount() < 3) {
            throw new IllegalStateException("You must attend 3 group sessions before creating a 1-on-1 session.");
        }

        Gym gym = gymRepository.findById(dto.getGymId())
                .orElseThrow(() -> new ResourceNotFoundException("Gym not found"));

        // Create the session (don't save yet)
        Session session = new Session();
        session.setCreator(user);
        session.setGym(gym);
        session.setSessionType(dto.getSessionType());
        session.setStatus(SessionStatus.active);
        session.setTitle(dto.getTitle());
        session.setStartTime(dto.getStartTime());
        session.setEndTime(dto.getEndTime());
        session.setMaxParticipants(dto.getMaxParticipants());

        // Chat Integration (MVP 3.6)
        String chatId = chatService.createChatForSession(session.getSessionId());
        session.setFirestoreChatId(chatId);

        // Save the session
        Session savedSession = sessionRepository.save(session);

        // Add the creator as the first participant
        SessionParticipantId creatorId = new SessionParticipantId();
        creatorId.setSessionId(savedSession.getSessionId());
        creatorId.setUserId(user.getUserId());

        SessionParticipant creatorEntry = new SessionParticipant();
        creatorEntry.setId(creatorId);
        creatorEntry.setSession(savedSession);
        creatorEntry.setUser(user);
        creatorEntry.setStatus(ParticipantStatus.joined);
        sessionParticipantRepository.save(creatorEntry);

        return savedSession;
    }

    /**
     * (Method 2) Join an existing session, applying all "Join" gates.
     */
    public void joinSession(UUID sessionId, String userPhoneNumber) {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));
        
        Session session = sessionRepository.findById(sessionId)
                .orElseThrow(() -> new ResourceNotFoundException("Session not found"));

        // Gate 1 (Probationary Mode - MVP 2.6)
        if (user.getVerificationStatus() == VerificationStatus.pending_review) {
            if (session.getCreator().getRole() != UserRole.ambassador) {
                throw new IllegalStateException("Verification pending. You can only join Ambassador sessions.");
            }
        }

        // Gate 2 (Reputation - MVP 3.5)
        if (session.getSessionType() == SessionType.one_on_one && user.getGroupSessionCount() < 3) {
            throw new IllegalStateException("You must attend 3 group sessions before joining a 1-on-1 session.");
        }

        // Gate 3 (Session Full?)
        int participantCount = sessionParticipantRepository.countBySessionId(sessionId);
        if (participantCount >= session.getMaxParticipants()) {
            throw new IllegalStateException("This session is already full.");
        }

        // Gate 4 (Already Joined?)
        SessionParticipantId participantId = new SessionParticipantId();
        participantId.setSessionId(sessionId);
        participantId.setUserId(user.getUserId());

        if (sessionParticipantRepository.existsById(participantId)) {
            throw new IllegalStateException("You have already joined this session.");
        }

        // Success: Create and save the participant entry
        SessionParticipant newParticipant = new SessionParticipant();
        newParticipant.setId(participantId);
        newParticipant.setSession(session);
        newParticipant.setUser(user);
        newParticipant.setStatus(ParticipantStatus.joined);
        sessionParticipantRepository.save(newParticipant);
    }

    /**
     * (Method 3) Get all active sessions for the feed.
     * (MVP 6.1)
     * NOW INCLUDES GENDER FILTERING AND PRIVACY/VISIBILITY LOGIC.
     * OPTIMIZED: Uses JOIN FETCH to prevent N+1 queries
     */
    @Transactional(readOnly = true)
    public List<Session> getActiveSessions(String userPhoneNumber, VerifiedGender genderFilter) {
        
        // 1. Get the user who is VIEWING the feed
        User viewer = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));

        List<Session> sessions;

        // 2. Apply the GENDER FILTER (existing logic) using optimized queries
        if (genderFilter != null) {
            // Security Check: You can only filter by your own gender.
            if (viewer.getVerifiedGender() != genderFilter) {
                throw new AccessDeniedException("You can only filter sessions by your own verified gender.");
            }
            // Use optimized query with JOIN FETCH
            sessions = sessionRepository.findByStatusAndCreatorVerifiedGenderWithCreatorAndGym(SessionStatus.active, genderFilter);
        } else {
            // Use optimized query with JOIN FETCH
            sessions = sessionRepository.findByStatusWithCreatorAndGym(SessionStatus.active);
        }

        // 3. Apply PRIVACY FILTER (new logic)
        return sessions.stream()
                .filter(session -> isVisible(session.getCreator(), viewer))
                .collect(Collectors.toList());
    }

    /**
     * Helper method to check if a creator's profile is visible to a viewer.
     */
    private boolean isVisible(User creator, User viewer) {
        // If creator is visible to all, return true.
        if (creator.getProfileVisibility() == ProfileVisibility.all) {
            return true;
        }

        // If creator is 'same_gender' only, check for match.
        if (creator.getProfileVisibility() == ProfileVisibility.same_gender) {
            // Both must be verified AND their genders must match.
            return creator.getVerifiedGender() != VerifiedGender.not_verified &&
                   creator.getVerifiedGender() == viewer.getVerifiedGender();
        }

        return false;
    }

    @Transactional
    public void markAttendance(MarkAttendanceDto dto, String markerPhoneNumber) {
        
        // 1. Find user who is marking attendance
        User markerUser = userRepository.findByPhoneNumber(markerPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", markerPhoneNumber));

        // 2. Find session
        Session session = sessionRepository.findById(dto.getSessionId())
                .orElseThrow(() -> new ResourceNotFoundException("Session", "sessionId", dto.getSessionId()));

        // 3. Permission check
        boolean isCreator = session.getCreator().getUserId().equals(markerUser.getUserId());
        boolean isAdmin = markerUser.getRole() == UserRole.admin;

        if (!isCreator && !isAdmin) {
            throw new AccessDeniedException("Only the session creator or an admin can mark attendance.");
        }

        // 4. Find SessionParticipant (the target object)
        SessionParticipantId participantId = new SessionParticipantId();
        participantId.setSessionId(dto.getSessionId());
        participantId.setUserId(dto.getParticipantUserId());

        SessionParticipant participant = sessionParticipantRepository.findById(participantId)
                .orElseThrow(() -> new ResourceNotFoundException("SessionParticipant", "Id", participantId));

        // 5. Update status
        participant.setStatus(dto.getNewStatus());
        sessionParticipantRepository.save(participant);

        // 6. Trigger chain (MVP 5.4)
        if (dto.getNewStatus() == ParticipantStatus.no_show) {
            // Calls logic in UserService
            userService.incrementNoShowCount(dto.getParticipantUserId());
        } 
        else if (dto.getNewStatus() == ParticipantStatus.attended) {
            // Check if it was a group session (MVP 3.5)
            if (session.getSessionType() == SessionType.group) {
                userService.incrementGroupSessionCount(dto.getParticipantUserId());
            }
        }
    }
}