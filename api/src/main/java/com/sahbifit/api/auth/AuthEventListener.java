package com.sahbifit.api.auth;

import java.time.OffsetDateTime;
import java.util.Random;

import org.springframework.context.event.EventListener;
import org.springframework.retry.annotation.Backoff;
import org.springframework.retry.annotation.Retryable;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sahbifit.api.external.sms.SmsService;
import com.sahbifit.api.user.model.User;
import com.sahbifit.api.user.repository.UserRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class AuthEventListener {

    private final UserRepository userRepository = null;
    private final SmsService smsService = null;

    @Async
    @Retryable(
        value = { Exception.class }, 
        maxAttempts = 3, 
        backoff = @Backoff(delay = 2000, multiplier = 2)
    )
    @EventListener
    @Transactional
    public void handleUserRegistration(UserRegisteredEvent event) {
        User user = event.getUser();
        log.info("Async: Processing registration event for user {}", user.getUserId());

        try {
            // 1. Generate OTP
            String otp = generateOtp();
            
            // 2. Save OTP to user
            // We fetch a fresh instance of the user to avoid detached entity issues
            User freshUser = userRepository.findById(user.getUserId())
                    .orElseThrow(() -> new RuntimeException("User not found for event"));

            freshUser.setSmsOtp(otp);
            freshUser.setSmsOtpExpiresAt(OffsetDateTime.now().plusMinutes(10));
            userRepository.save(freshUser);

            // 3. Send SMS
            smsService.sendVerificationSms(freshUser.getPhoneNumber(), otp);
            log.info("Async: SMS sent successfully to user {}", freshUser.getUserId());

        } catch (Exception e) {
            log.error("Async Error: Failed to send SMS for user {} after retries: {}", 
                user.getUserId(), e.getMessage(), e);
            // The @Retryable will handle re-triggering.
            // After all retries fail, it will just log the error.
            throw e; // Re-throw to trigger retry
        }
    }

    private String generateOtp() {
        // Generates a 6-digit code
        return String.format("%06d", new Random().nextInt(999999));
    }
}