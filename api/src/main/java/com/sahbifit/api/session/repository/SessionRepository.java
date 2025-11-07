// Pfad: src/main/java/com/sahbifit/api/session/repository/SessionRepository.java
package com.sahbifit.api.session.repository;

import java.util.List;
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
}