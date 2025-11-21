package com.sahbifit.api.user;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

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
import com.sahbifit.api.user.dto.PublicUserProfileDto;
import com.sahbifit.api.user.dto.UpdateFcmTokenDto;
import com.sahbifit.api.user.dto.UpdateVisibilityDto;
import com.sahbifit.api.user.dto.UserProfileDto;
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
    
    // Defines limit for Late Cancellations (Cancel < 1h before)
    // 6 cancels = Badge (treated as half a no-show ratio compared to 3)
    private static final int LATE_CANCEL_LIMIT = 6; 
    
    private static final String UNRELIABLE_BADGE_NAME = "UNRELIABLE";

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
     * Increases the "No-Show" counter.
     */
    @Transactional
    public void incrementNoShowCount(UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "userId", userId));

        int newNoShowCount = user.getNoShowCount() + 1;
        user.setNoShowCount(newNoShowCount);

        // Check Threshold
        if (newNoShowCount >= NO_SHOW_LIMIT) {
            applyUnreliablePenalty(user, "no-shows", newNoShowCount);
        } else {
            log.info("User {} 'no-show' count incremented to {}.", userId, newNoShowCount);
        }
        userRepository.save(user);
    }

    /**
     * Increases the "Late Cancel" counter.
     * Called when a user cancels less than 1 hour before session start.
     */
    @Transactional
    public void incrementLateCancelCount(UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "userId", userId));

        int newCancelCount = user.getLateCancelCount() + 1;
        user.setLateCancelCount(newCancelCount);

        // Check Threshold (6 cancels)
        if (newCancelCount >= LATE_CANCEL_LIMIT) {
            applyUnreliablePenalty(user, "late cancellations", newCancelCount);
        } else {
            log.info("User {} 'late cancel' count incremented to {}.", userId, newCancelCount);
        }
        userRepository.save(user);
    }

    /**
     * Helper to apply suspension and badge logic.
     */
    private void applyUnreliablePenalty(User user, String reasonType, int count) {
        // Block user
        user.setStatus(UserStatus.suspended);
        user.setSuspendedUntil(OffsetDateTime.now().plusDays(3)); // 3-day block
        
        // Reset the specific counters (optional: resetting both might be fairer, 
        // but here we just reset the one that triggered it to avoid confusion)
        if (reasonType.equals("no-shows")) user.setNoShowCount(0);
        if (reasonType.equals("late cancellations")) user.setLateCancelCount(0);

        log.warn("User {} suspended for 3 days due to {} {}.", user.getUserId(), count, reasonType);
        
        try {
            awardUnreliableBadge(user);
        } catch (Exception e) {
            log.error("Failed to award UNRELIABLE badge to user {}: {}", user.getUserId(), e.getMessage());
        }
    }

    private void awardUnreliableBadge(User user) {
        Badge unreliableBadge = badgeRepository.findByBadgeName(UNRELIABLE_BADGE_NAME)
                .orElseThrow(() -> new RuntimeException(UNRELIABLE_BADGE_NAME + " badge not found in database."));

        UserBadgeId userBadgeId = new UserBadgeId();
        userBadgeId.setUserId(user.getUserId());
        userBadgeId.setBadgeId(unreliableBadge.getBadgeId());

        if (userBadgeRepository.existsById(userBadgeId)) {
            return; 
        }

        UserBadge newUserBadge = new UserBadge();
        newUserBadge.setId(userBadgeId);
        newUserBadge.setUser(user);
        newUserBadge.setBadge(unreliableBadge);
        
        userBadgeRepository.save(newUserBadge);
        log.info("Awarded {} badge to user {}", UNRELIABLE_BADGE_NAME, user.getUserId());
    }

    @Transactional
    public void blockUser(String blockerPhoneNumber, UUID blockedUserId) {
        User blockerUser = userRepository.findByPhoneNumber(blockerPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", blockerPhoneNumber));

        User blockedUser = userRepository.findById(blockedUserId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "userId", blockedUserId));

        if (blockerUser.getUserId().equals(blockedUser.getUserId())) {
            throw new IllegalArgumentException("A user cannot block themselves.");
        }

        boolean alreadyBlocked = userBlockRepository.existsByBlockerUserIdAndBlockedUserId(
                blockerUser.getUserId(), blockedUser.getUserId());

        if (alreadyBlocked) {
            return;
        }

        UserBlockId blockId = new UserBlockId();
        blockId.setBlockerUserId(blockerUser.getUserId());
        blockId.setBlockedUserId(blockedUser.getUserId());

        UserBlock newBlock = new UserBlock();
        newBlock.setId(blockId);
        newBlock.setBlocker(blockerUser);
        newBlock.setBlocked(blockedUser);

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

        if (dto.visibility() == ProfileVisibility.same_gender && 
            user.getVerifiedGender() == VerifiedGender.not_verified) {
            
            throw new IllegalStateException("You must be gender-verified to use this privacy setting.");
        }

        user.setProfileVisibility(dto.visibility());
        userRepository.save(user);
        log.info("Updated profile visibility for user {} to {}", user.getUserId(), dto.visibility());
    }

    @Transactional(readOnly = true)
    public List<PublicUserProfileDto> getBlockedUsers(String userPhoneNumber) {
        User blockerUser = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", userPhoneNumber));

        // --- FIX STARTS HERE ---
        // Use the new repository method passing the User entity
        List<UserBlock> blocks = userBlockRepository.findAllByBlocker(blockerUser);
        // --- FIX ENDS HERE ---

        return blocks.stream()
                .map(UserBlock::getBlocked)
                .map(PublicUserProfileDto::fromUser)
                .collect(Collectors.toList());
    }

    @Transactional
    public void unblockUser(String blockerPhoneNumber, UUID blockedUserIdToUnblock) {
        User blockerUser = userRepository.findByPhoneNumber(blockerPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", blockerPhoneNumber));

        userBlockRepository.deleteByBlockerUserIdAndBlockedUserId(
            blockerUser.getUserId(),
            blockedUserIdToUnblock
        );
        
        log.info("User {} unblocked user {}", blockerUser.getUserId(), blockedUserIdToUnblock);
    }

    @Transactional(readOnly = true)
    public UserProfileDto getMyProfile(String phoneNumber) {
        User user = userRepository.findByPhoneNumber(phoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", phoneNumber));
        
        return UserMapper.toProfileDto(user);
    }

    @Transactional(readOnly = true)
    public UserProfileDto getUserProfile(UUID targetUserId, String requesterPhoneNumber) { // <-- UPDATED SIGNATURE
        User requester = userRepository.findByPhoneNumber(requesterPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", requesterPhoneNumber));

        // 1. Check "The Nuclear Wall" (Block check)
        if (userBlockRepository.hasBlockRelationship(requester.getUserId(), targetUserId)) {
            // We throw Not Found so the blocker/blocked user appears to not exist at all.
            throw new ResourceNotFoundException("User", "userId", targetUserId);
        }

        User targetUser = userRepository.findById(targetUserId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "userId", targetUserId));
        
        return UserMapper.toProfileDto(targetUser);
    }
}