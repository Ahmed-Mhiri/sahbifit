package com.sahbifit.api.external.push;

import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import com.sahbifit.api.session.model.Session;
import com.sahbifit.api.user.model.User;
import com.sahbifit.api.verification.model.VerificationStatus;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class FirebasePushNotificationService implements PushNotificationService {

    // FirebaseMessaging is initialized in your FirebaseConfig.java
    private final FirebaseMessaging fcm;

    public FirebasePushNotificationService(FirebaseMessaging fcm) {
        this.fcm = fcm;
    }

    @Override
    public void sendVerificationApproved(User user) {
        String token = user.getPushNotificationToken();
        if (token == null || token.isEmpty()) {
            log.warn("Cannot send 'Verification Approved' push: User {} has no FCM token.", user.getUserId());
            return;
        }

        Notification notification = Notification.builder()
                .setTitle("You're verified! ✅")
                .setBody("Welcome to SahbiFit. You can now join all sessions and post your own.")
                .build();

        Message message = Message.builder()
                .setToken(token)
                .setNotification(notification)
                .putData("type", "VERIFICATION_APPROVED")
                .build();

        send(message, user.getUserId());
    }

    @Override
    public void sendVerificationRejected(User user, VerificationStatus reason) {
        String token = user.getPushNotificationToken();
        if (token == null || token.isEmpty()) {
            log.warn("Cannot send 'Verification Rejected' push: User {} has no FCM token.", user.getUserId());
            return;
        }

        String reasonText = reason == VerificationStatus.rejected_mismatch 
            ? "due to a mismatch" 
            : "due to poor video quality";

        Notification notification = Notification.builder()
                .setTitle("Verification Update")
                .setBody("Your verification was rejected " + reasonText + ". Please submit a new video.")
                .build();

        Message message = Message.builder()
                .setToken(token)
                .setNotification(notification)
                .putData("type", "VERIFICATION_REJECTED")
                .build();
        
        send(message, user.getUserId());
    }

    private void send(Message message, java.util.UUID userId) {
        try {
            fcm.send(message);
            log.info("Push notification sent successfully to user {}", userId);
        } catch (FirebaseMessagingException e) {
            log.error("Failed to send push notification to user {}: {}", userId, e.getMessage());
        }
    }

    // --- ADD THIS ENTIRE METHOD ---
    @Override
    public void sendRatingReminder(User user, Session session) {
        String token = user.getPushNotificationToken();
        if (token == null || token.isEmpty()) {
            log.warn("Cannot send 'Rating Reminder' push: User {} has no FCM token.", user.getUserId());
            return;
        }

        String sessionTitle = session.getTitle().length() > 30 ? 
            session.getTitle().substring(0, 30) + "..." : 
            session.getTitle();

        Notification notification = Notification.builder()
                .setTitle("How was your session? 🤔")
                .setBody("Your session '" + sessionTitle + "' is complete. Tap here to rate your partners!")
                .build();

        Message message = Message.builder()
                .setToken(token)
                .setNotification(notification)
                .putData("type", "PENDING_RATING") // Client can use this to navigate
                .putData("sessionId", session.getSessionId().toString())
                .build();
        
        send(message, user.getUserId());
    }
}