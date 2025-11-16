// Pfad: src/main/java/com/sahbifit/api/session/repository/SessionParticipantRepository.java
package com.sahbifit.api.session.repository;

import java.util.List;

import com.sahbifit.api.session.model.SessionParticipant;
import com.sahbifit.api.session.model.SessionParticipantId;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sahbifit.api.session.model.ParticipantStatus;
import com.sahbifit.api.session.model.Session;
import com.sahbifit.api.user.model.User;

import java.util.UUID;

@Repository
public interface SessionParticipantRepository extends JpaRepository<SessionParticipant, SessionParticipantId> {

    /**
     * Counts the number of participants in a given session.
     * Required by SessionService.joinSession() Gate 3.
     */
    int countBySession_SessionId(UUID sessionId);
    
    // existsById(SessionParticipantId id) is provided by JpaRepository
    // and used in SessionService.joinSession() Gate 4.


    /**
     * Finds all participations for a user with a specific status.
     */
    List<SessionParticipant> findByUserAndStatus(User user, ParticipantStatus status);
    
    /**
     * Finds all participants for a specific session.
     */
    List<SessionParticipant> findBySession(Session session);


    /**
     * Finds all participants for a specific session with a given status.
     */
    List<SessionParticipant> findBySessionAndStatus(Session session, ParticipantStatus status);
}