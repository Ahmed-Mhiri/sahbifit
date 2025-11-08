package com.sahbifit.api.user;

import java.time.OffsetDateTime;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sahbifit.api.badge.model.Badge;
import com.sahbifit.api.badge.model.UserBadge;
import com.sahbifit.api.badge.model.UserBadgeId;
import com.sahbifit.api.badge.repository.BadgeRepository;
import com.sahbifit.api.badge.repository.UserBadgeRepository;
import com.sahbifit.api.exception.ResourceNotFoundException;
import com.sahbifit.api.user.dto.UpdateFcmTokenDto;
import com.sahbifit.api.user.dto.UpdateVisibilityDto;
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
    private final BadgeRepository badgeRepository;
    private final UserBadgeRepository userBadgeRepository;

    // Defines the limit for "No-Shows"
    private static final int NO_SHOW_LIMIT = 3;
    private static final String UNRELIABLE_BADGE_NAME = "UNRELIABLE";

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
            
            // --- NEW LOGIC ---
            // 4. Award the "Unreliable" badge
            try {
                awardUnreliableBadge(user);
            } catch (Exception e) {
                log.error("Failed to award UNRELIABLE badge to user {}: {}", userId, e.getMessage());
                // Don't fail the transaction, just log the error
            }
            // --- END NEW LOGIC ---

        } else {
            log.info("User {} 'no-show' count incremented to {}.", userId, newNoShowCount);
        }

        // 5. Save user
        userRepository.save(user);
    }

    /**
     * Awards the "UNRELIABLE" badge to a user
     */
    private void awardUnreliableBadge(User user) {
        // Find the master "Unreliable" badge
        Badge unreliableBadge = badgeRepository.findByBadgeName(UNRELIABLE_BADGE_NAME)
                .orElseThrow(() -> new RuntimeException(UNRELIABLE_BADGE_NAME + " badge not found in database."));

        // Create the composite key
        UserBadgeId userBadgeId = new UserBadgeId();
        userBadgeId.setUserId(user.getUserId());
        userBadgeId.setBadgeId(unreliableBadge.getBadgeId());

        // Check if user already has this badge
        if (userBadgeRepository.existsById(userBadgeId)) {
            return; // Already has it, do nothing
        }

        // Assign the badge
        UserBadge newUserBadge = new UserBadge();
        newUserBadge.setId(userBadgeId);
        newUserBadge.setUser(user);
        newUserBadge.setBadge(unreliableBadge);
        
        userBadgeRepository.save(newUserBadge);
        log.info("Awarded {} badge to user {}", UNRELIABLE_BADGE_NAME, user.getUserId());
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
    public void updateFcmToken(String userPhoneNumber, UpdateFcmTokenDto dto) {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", userPhoneNumber));
        
        user.setPushNotificationToken(dto.fcmToken());
        userRepository.save(user);
        log.info("Updated FCM token for user: {}", user.getUserId());
    }

    @Transactional
    public void updateProfileVisibility(String userPhoneNumber, UpdateVisibilityDto dto) {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", userPhoneNumber));

        // Validation: You cannot set visibility to "same_gender" if you are not gender-verified.
        if (dto.visibility() == ProfileVisibility.same_gender && 
            user.getVerifiedGender() == VerifiedGender.not_verified) {
            
            throw new IllegalStateException("You must be gender-verified to use this privacy setting.");
        }

        user.setProfileVisibility(dto.visibility());
        userRepository.save(user);
        log.info("Updated profile visibility for user {} to {}", user.getUserId(), dto.visibility());
    }
}