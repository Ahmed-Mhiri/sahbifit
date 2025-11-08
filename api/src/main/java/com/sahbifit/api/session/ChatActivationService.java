package com.sahbifit.api.session;

import com.sahbifit.api.session.model.Session;
import com.sahbifit.api.session.repository.SessionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.OffsetDateTime;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ChatActivationService {

    private final SessionRepository sessionRepository;

    // Activation window: 1 hour (60 minutes)
    private static final int ACTIVATION_WINDOW_MINUTES = 60;
    
    // Deactivation window: 1 hour (60 minutes)
    private static final int DEACTIVATION_WINDOW_MINUTES = 60;

    // Scheduler runs every 10 minutes (600,000 milliseconds)
    private static final long JOB_RATE_MS = 600000;

    /**
     * Runs every 10 minutes to activate chats for upcoming sessions.
     */
    @Scheduled(fixedRate = JOB_RATE_MS) 
    @Transactional
    public void activateUpcomingChats() {
        OffsetDateTime now = OffsetDateTime.now();
        OffsetDateTime activationTime = now.plusMinutes(ACTIVATION_WINDOW_MINUTES);

        log.info("[ChatScheduler] Running activation job. Finding sessions starting before: {}", activationTime);

        List<Session> sessionsToActivate = sessionRepository.findSessionsToActivate(now, activationTime);

        if (sessionsToActivate.isEmpty()) {
            log.info("[ChatScheduler] No sessions found for chat activation.");
            return;
        }

        log.info("[ChatScheduler] Activating chat for {} sessions.", sessionsToActivate.size());
        for (Session session : sessionsToActivate) {
            session.setChatActive(true);
            // We don't set isChatProcessed yet; that's for the deactivation job
        }
        
        // Batch save
        sessionRepository.saveAll(sessionsToActivate);
    }

    /**
     * Runs every 10 minutes to deactivate chats for completed sessions.
     */
    @Scheduled(fixedRate = JOB_RATE_MS) 
    @Transactional
    public void deactivateCompletedChats() {
        OffsetDateTime now = OffsetDateTime.now();
        OffsetDateTime deactivationTime = now.minusMinutes(DEACTIVATION_WINDOW_MINUTES);

        log.info("[ChatScheduler] Running deactivation job. Finding sessions ending before: {}", deactivationTime);

        List<Session> sessionsToDeactivate = sessionRepository.findSessionsToDeactivate(deactivationTime);

        if (sessionsToDeactivate.isEmpty()) {
            log.info("[ChatScheduler] No sessions found for chat deactivation.");
            return;
        }

        log.info("[ChatScheduler] Deactivating chat for {} sessions.", sessionsToDeactivate.size());
        for (Session session : sessionsToDeactivate) {
            session.setChatActive(false);
            session.setChatProcessed(true); // Mark as done to prevent re-processing
        }
        
        // Batch save
        sessionRepository.saveAll(sessionsToDeactivate);
    }
}