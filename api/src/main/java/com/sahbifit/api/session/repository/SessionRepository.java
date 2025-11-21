// Path: src/main/java/com/sahbifit/api/session/repository/SessionRepository.java
package com.sahbifit.api.session.repository;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.Optional; // <-- ADDED
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sahbifit.api.session.model.Session;
import com.sahbifit.api.session.model.SessionStatus;
import com.sahbifit.api.verification.model.VerifiedGender;

@Repository
public interface SessionRepository extends JpaRepository<Session, UUID> {

    /**
     * Finds all sessions with a specific status (e.g., 'active').
     * Required by SessionService.getActiveSessions() (MVP 6.1)
     */
    List<Session> findByStatus(SessionStatus status);
    
    List<Session> findByStatusAndCreatorVerifiedGender(SessionStatus status, VerifiedGender gender);
    
    /**
     * Finds all sessions with a specific status, fetching creator and gym data in one query.
     * This prevents N+1 query problem when accessing session.getCreator() and session.getGym()
     */
    @Query("SELECT s FROM Session s JOIN FETCH s.creator JOIN FETCH s.gym WHERE s.status = :status")
    List<Session> findByStatusWithCreatorAndGym(@Param("status") SessionStatus status);
    
    /**
     * Finds all sessions with specific status and creator gender, fetching creator and gym data in one query.
     * This prevents N+1 query problem when accessing session.getCreator() and session.getGym()
     */
    @Query("SELECT s FROM Session s JOIN FETCH s.creator JOIN FETCH s.gym WHERE s.status = :status AND s.creator.verifiedGender = :gender")
    List<Session> findByStatusAndCreatorVerifiedGenderWithCreatorAndGym(
            @Param("status") SessionStatus status, 
            @Param("gender") VerifiedGender gender);

    /**
     * Finds sessions that have ended but for which rating notifications
     * have not yet been sent.
     */
    @Query("SELECT s FROM Session s WHERE s.endTime < :now AND s.isRatingNotified = false AND s.status = 'active'")
    List<Session> findCompletedSessionsPendingNotification(@Param("now") OffsetDateTime now);

    /**
     * Finds a single session by its ID, fetching creator and gym data in one query.
     * This prevents N+1 queries.
     */
    @Query("SELECT s FROM Session s JOIN FETCH s.creator JOIN FETCH s.gym WHERE s.sessionId = :sessionId")
    Optional<Session> findByIdWithCreatorAndGym(@Param("sessionId") UUID sessionId);

    // --- NEW METHODS FOR EPHEMERAL CHAT ---

    /**
     * Finds sessions that are scheduled to start within the activation window
     * (e.g., 60 minutes from now) and have not been activated yet.
     */
    @Query("SELECT s FROM Session s WHERE s.startTime BETWEEN :now AND :activationTime " +
           "AND s.isChatActive = false AND s.isChatProcessed = false AND s.status = 'active'")
    List<Session> findSessionsToActivate(
            @Param("now") OffsetDateTime now,
            @Param("activationTime") OffsetDateTime activationTime);

    /**
     * Finds sessions that ended more than 1 hour ago, are still marked as active,
     * and have not been processed for deactivation.
     */
    @Query("SELECT s FROM Session s WHERE s.endTime < :deactivationTime " +
           "AND s.isChatActive = true AND s.isChatProcessed = false AND s.status = 'active'")
    List<Session> findSessionsToDeactivate(
            @Param("deactivationTime") OffsetDateTime deactivationTime);

    // --- ADD THIS METHOD ---
    /**
     * Finds all sessions where the specific user is a participant.
     * Uses JOIN FETCH for creator and gym to ensure efficient DTO mapping.
     * Ordered by Start Time descending (newest first).
     */
    @Query("SELECT DISTINCT s FROM Session s " +
           "JOIN FETCH s.creator " +
           "JOIN FETCH s.gym " +
           "JOIN s.participants p " +
           "WHERE p.user.userId = :userId " +
           "ORDER BY s.startTime DESC")
    List<Session> findSessionsByParticipantUserId(@Param("userId") UUID userId);
}