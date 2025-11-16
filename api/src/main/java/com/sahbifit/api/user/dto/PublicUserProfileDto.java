package com.sahbifit.api.user.dto;

import com.sahbifit.api.user.model.User;
import com.sahbifit.api.verification.model.VerificationStatus;
import java.util.UUID;

/**
 * A safe DTO for representing a user's public profile.
 */
public record PublicUserProfileDto(
    UUID userId,
    String firstName,
    String profilePhotoUrl,
    VerificationStatus verificationStatus
) {
    /**
     * Helper method to convert a User entity to this safe DTO.
     */
    public static PublicUserProfileDto fromUser(User user) {
        if (user == null) return null;
        return new PublicUserProfileDto(
            user.getUserId(),
            user.getFirstName(),
            user.getProfilePhotoUrl(),
            user.getVerificationStatus()
        );
    }
}