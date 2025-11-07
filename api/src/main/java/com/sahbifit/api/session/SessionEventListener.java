package com.sahbifit.api.session;

import com.sahbifit.api.external.chat.ChatService;
import com.sahbifit.api.session.model.Session;
import com.sahbifit.api.session.repository.SessionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.retry.annotation.Backoff;
import org.springframework.retry.annotation.Retryable;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class SessionEventListener {

    private final ChatService chatService;
    private final SessionRepository sessionRepository; 

    @Async
    @EventListener
    @Retryable(
        value = {Exception.class},
        maxAttempts = 3,
        backoff = @Backoff(delay = 2000, multiplier = 2) // 2s, 4s, 8s delays
    )
    public void handleSessionCreation(SessionCreatedEvent event) {
        try {
            Session session = event.getSession();
            
            log.info("Async: Creating chat for session {}", session.getSessionId());

            String chatId = chatService.createChatForSession(session.getSessionId());

            session.setFirestoreChatId(chatId);
            sessionRepository.save(session);

            log.info("Async: Chat created for session {}. ChatID: {}", session.getSessionId(), chatId);

        } catch (Exception e) {
            log.error("Async Error: Failed to create chat for session {} after retries: {}", 
                      event.getSession().getSessionId(), e.getMessage(), e);
            // After all retries fail, you can implement fallback logic here
            handlePermanentFailure(event.getSession(), e);
        }
    }

    private void handlePermanentFailure(Session session, Exception e) {
        log.error("Permanent failure: Could not create chat for session {}. Session will remain without chat.", 
                  session.getSessionId());
        // Optionally, you can set a flag or send a notification
        // session.setChatCreationFailed(true);
        // sessionRepository.save(session);
    }
}