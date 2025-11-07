package com.sahbifit.api.user;

import java.time.OffsetDateTime;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sahbifit.api.exception.ResourceNotFoundException;
import com.sahbifit.api.user.model.ProfileVisibility;
import com.sahbifit.api.user.model.User;
import com.sahbifit.api.user.model.UserBlock;
import com.sahbifit.api.user.model.UserBlockId;
import com.sahbifit.api.user.model.UserStatus;
import com.sahbifit.api.user.repository.UserBlockRepository;
import com.sahbifit.api.user.repository.UserRepository;
import com.sahbifit.api.verification.model.VerifiedGender;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

    private static final Logger log = LoggerFactory.getLogger(UserService.class);
    private final UserRepository userRepository;
    private final UserBlockRepository userBlockRepository;

    // Defines the limit for "No-Shows"
    private static final int NO_SHOW_LIMIT = 3;

    /**
     * Increases the counter for completed group sessions of a user.
     * (MVP 3.5 Logic)
     */
    @Transactional
    public void incrementGroupSessionCount(UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "userId", userId));
        
        int newGroupCount = user.getGroupSessionCount() + 1;
        user.setGroupSessionCount(newGroupCount);
        userRepository.save(user);
        
        log.info("User {} group session count incremented to {}.", userId, newGroupCount);
    }

    /**
     * Increases the "No-Show" counter for a user and applies a block if necessary.
     * (MVP 5.4 & 5.5 Logic)
     */
    @Transactional
    public void incrementNoShowCount(UUID userId) {
        // 1. Find user
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "userId", userId));

        // 2. Increase counter
        int newNoShowCount = user.getNoShowCount() + 1;
        user.setNoShowCount(newNoShowCount);

        // 3. Block check (MVP 5.5)
        if (newNoShowCount >= NO_SHOW_LIMIT) {
            // Block user
            user.setStatus(UserStatus.suspended);
            user.setSuspendedUntil(OffsetDateTime.now().plusDays(3)); // 3-day block
            
            // Reset counter after applying the block
            user.setNoShowCount(0); 

            log.warn("User {} suspended for 3 days due to {} no-shows.", userId, newNoShowCount);
            
            // (Optional: Trigger an event for a push notification here)
            // e.g. eventPublisher.publishEvent(new UserSuspendedEvent(this, user, "3 days"));

        } else {
            log.info("User {} 'no-show' count incremented to {}.", userId, newNoShowCount);
        }

        // 4. Save user
        userRepository.save(user);
    }

    /**
     * Allows a user to block another user.
     * (MVP 4.2 Logic)
     */
    @Transactional
    public void blockUser(String blockerPhoneNumber, UUID blockedUserId) {
        // 1. Find blocker user
        User blockerUser = userRepository.findByPhoneNumber(blockerPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", blockerPhoneNumber));

        // 2. Find user to be blocked
        User blockedUser = userRepository.findById(blockedUserId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "userId", blockedUserId));

        // 3. Prevent self-blocking
        if (blockerUser.getUserId().equals(blockedUser.getUserId())) {
            throw new IllegalArgumentException("A user cannot block themselves.");
        }

        // 4. Check if already blocked
        boolean alreadyBlocked = userBlockRepository.existsByBlockerUserIdAndBlockedUserId(
                blockerUser.getUserId(), blockedUser.getUserId());

        if (alreadyBlocked) {
            return;
        }

        // 5. Create UserBlock entity
        UserBlockId blockId = new UserBlockId();
        blockId.setBlockerUserId(blockerUser.getUserId());
        blockId.setBlockedUserId(blockedUser.getUserId());

        UserBlock newBlock = new UserBlock();
        newBlock.setId(blockId);
        newBlock.setBlocker(blockerUser);
        newBlock.setBlocked(blockedUser);

        // 6. Save block
        userBlockRepository.save(newBlock);
    }

    @Transactional
    public void updateFcmToken(String userPhoneNumber, String fcmToken) {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", userPhoneNumber));
        
        user.setPushNotificationToken(fcmToken);
        userRepository.save(user);
        log.info("Updated FCM token for user: {}", user.getUserId());
    }

    @Transactional
    public void updateProfileVisibility(String userPhoneNumber, ProfileVisibility newVisibility) {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", userPhoneNumber));

        // Validation: You cannot set visibility to "same_gender" if you are not gender-verified.
        if (newVisibility == ProfileVisibility.same_gender && 
            user.getVerifiedGender() == VerifiedGender.not_verified) {
            
            throw new IllegalStateException("You must be gender-verified to use this privacy setting.");
        }

        user.setProfileVisibility(newVisibility);
        userRepository.save(user);
        log.info("Updated profile visibility for user {} to {}", user.getUserId(), newVisibility);
    }
}