// Path: RatingNotifierService.java (NEW FILE)
package com.sahbifit.api.rating;

import com.sahbifit.api.external.push.PushNotificationService;
import com.sahbifit.api.session.model.ParticipantStatus;
import com.sahbifit.api.session.model.Session;
import com.sahbifit.api.session.model.SessionParticipant;
import com.sahbifit.api.session.repository.SessionParticipantRepository;
import com.sahbifit.api.session.repository.SessionRepository;
import com.sahbifit.api.user.model.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class RatingNotifierService {

    private final SessionRepository sessionRepository;
    private final SessionParticipantRepository sessionParticipantRepository;
    private final PushNotificationService pushNotificationService;

    /**
     * Runs every 15 minutes to check for completed sessions
     * and trigger rating push notifications.
     */
    @Scheduled(fixedRate = 900000) // 900000ms = 15 minutes
    @Transactional
    public void triggerPendingRatings() {
        log.info("Running pending rating notifier job...");

        // 1. Find sessions that ended and haven't been processed
        List<Session> sessionsToNotify = sessionRepository
                .findCompletedSessionsPendingNotification(OffsetDateTime.now());

        if (sessionsToNotify.isEmpty()) {
            log.info("No sessions found for rating notification.");
            return;
        }

        log.info("Found {} sessions to process for rating notifications.", sessionsToNotify.size());

        for (Session session : sessionsToNotify) {
            try {
                // 2. Find all users who were marked as 'attended'
                List<SessionParticipant> attendees = sessionParticipantRepository
                        .findBySessionAndStatus(session, ParticipantStatus.attended);

                // No need to send notifications if fewer than 2 people attended
                if (attendees.size() < 2) {
                    log.warn("Skipping session {} (not enough attendees)", session.getSessionId());
                } else {
                    // 3. Send a push notification to each attendee
                    Set<User> attendeeUsers = attendees.stream()
                            .map(SessionParticipant::getUser)
                            .collect(Collectors.toSet());
                    
                    for (User user : attendeeUsers) {
                        pushNotificationService.sendRatingReminder(user, session);
                    }
                }
                
                // 4. Mark the session as processed so we don't send notifications again
                session.setRatingNotified(true);
                sessionRepository.save(session);

            } catch (Exception e) {
                log.error("Failed to process rating notification for session {}: {}",
                        session.getSessionId(), e.getMessage(), e);
                // Continue to the next session
            }
        }

        log.info("Rating notifier job finished.");
    }
}