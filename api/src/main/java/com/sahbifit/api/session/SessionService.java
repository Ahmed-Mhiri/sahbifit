// Path: src/main/java/com/sahbifit/api/session/SessionService.java
package com.sahbifit.api.session;

import java.util.List;
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

    /**
     * (Method 1) Create a new session, applying all "Create" gates.
     */
    public Session createSession(CreateSessionDto dto, String userPhoneNumber) {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", userPhoneNumber));

        // Gate 1 (Verification)
        if (user.getVerificationStatus() != VerificationStatus.verified) {
            throw new IllegalStateException("You must be fully verified to create a session.");
        }

        // Gate 2 (Reputation - "The 1-Session Gate" Strategy)
        if (dto.sessionType() == SessionType.one_on_one && user.getGroupSessionCount() < 1) { // <-- CHANGED FROM 3 to 1
            throw new IllegalStateException("You must attend 1 group session before creating a 1-on-1 session."); // <-- UPDATED MESSAGE
        }

        Gym gym = gymRepository.findById(dto.gymId())
                .orElseThrow(() -> new ResourceNotFoundException("Gym", "gymId", dto.gymId()));

        // Create the session (don't save yet)
        Session session = new Session();
        session.setCreator(user);
        session.setGym(gym);
        session.setSessionType(dto.sessionType());
        session.setStatus(SessionStatus.active);
        session.setTitle(dto.title());
        session.setStartTime(dto.startTime());
        session.setEndTime(dto.endTime());
        session.setMaxParticipants(dto.maxParticipants());

        // Save the session (This is where the session.sessionId is generated)
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

        // PUBLISH THE EVENT for the async listener
        try {
            // We pass 'savedSession', which now has a non-null ID
            eventPublisher.publishEvent(new SessionCreatedEvent(this, savedSession));
        } catch (Exception e) {
            log.error("Failed to publish SessionCreatedEvent for session {}: {}", savedSession.getSessionId(), e.getMessage());
            // Log error, but don't fail the transaction
        }

        return savedSession;
    }

    /**
     * (Method 2) Join an existing session, applying all "Join" gates.
     */
    public void joinSession(UUID sessionId, String userPhoneNumber) {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", userPhoneNumber));
        
        Session session = sessionRepository.findById(sessionId)
                .orElseThrow(() -> new ResourceNotFoundException("Session", "sessionId", sessionId));

        // Gate 1 (Probationary Mode - MVP 2.6)
        if (user.getVerificationStatus() == VerificationStatus.pending_review) {
            if (session.getCreator().getRole() != UserRole.ambassador) {
                throw new IllegalStateException("Verification pending. You can only join Ambassador sessions.");
            }
        }

        // Gate 2 (Reputation - "The 1-Session Gate" Strategy)
        if (session.getSessionType() == SessionType.one_on_one && user.getGroupSessionCount() < 1) { // <-- CHANGED FROM 3 to 1
            throw new IllegalStateException("You must attend 1 group session before joining a 1-on-1 session."); // <-- UPDATED MESSAGE
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
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", userPhoneNumber));

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
     * (NEW METHOD) Get a single session by its ID.
     * Applies all "View" gates (privacy, visibility, probation).
     */
    @Transactional(readOnly = true)
    public Session getSessionById(UUID sessionId, String userPhoneNumber) {
        
        // 1. Get the session with creator and gym (optimized)
        Session session = sessionRepository.findByIdWithCreatorAndGym(sessionId)
                .orElseThrow(() -> new ResourceNotFoundException("Session", "sessionId", sessionId));

        // 2. Get the user who is VIEWING the session
        User viewer = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", userPhoneNumber));

        // 3. Apply PRIVACY FILTER (re-using existing helper)
        if (!isVisible(session.getCreator(), viewer)) {
            // Hide its existence
            throw new ResourceNotFoundException("Session", "sessionId", sessionId);
        }

        // 4. Apply PROBATIONARY MODE FILTER (Gate 1 from joinSession)
        if (viewer.getVerificationStatus() == VerificationStatus.pending_review) {
            if (session.getCreator().getRole() != UserRole.ambassador) {
                throw new AccessDeniedException("Verification pending. You can only view Ambassador sessions.");
            }
        }

        return session;
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
        Session session = sessionRepository.findById(dto.sessionId())
                .orElseThrow(() -> new ResourceNotFoundException("Session", "sessionId", dto.sessionId()));

        // 3. Permission check
        boolean isCreator = session.getCreator().getUserId().equals(markerUser.getUserId());
        boolean isAdmin = markerUser.getRole() == UserRole.admin;

        if (!isCreator && !isAdmin) {
            throw new AccessDeniedException("Only the session creator or an admin can mark attendance.");
        }

        // 4. Find SessionParticipant (the target object)
        SessionParticipantId participantId = new SessionParticipantId();
        participantId.setSessionId(dto.sessionId());
        participantId.setUserId(dto.participantUserId());

        SessionParticipant participant = sessionParticipantRepository.findById(participantId)
                .orElseThrow(() -> new ResourceNotFoundException("SessionParticipant", "Id", participantId));

        // 5. Update status
        participant.setStatus(dto.newStatus());
        sessionParticipantRepository.save(participant);

        // 6. Trigger chain (MVP 5.4)
        if (dto.newStatus() == ParticipantStatus.no_show) {
            // Calls logic in UserService
            userService.incrementNoShowCount(dto.participantUserId());
        } 
        else if (dto.newStatus() == ParticipantStatus.attended) {
            // Check if it was a group session (MVP 3.5)
            if (session.getSessionType() == SessionType.group) {
                userService.incrementGroupSessionCount(dto.participantUserId());
            }
        }
    }
}