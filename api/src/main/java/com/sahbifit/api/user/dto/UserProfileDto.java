package com.sahbifit.api.user.dto;

import com.sahbifit.api.gym.dto.GymDto;
import com.sahbifit.api.user.model.ProfileVisibility;
import com.sahbifit.api.user.model.UserRole;
import com.sahbifit.api.user.model.UserStatus;
import com.sahbifit.api.verification.model.VerificationStatus;
import com.sahbifit.api.verification.model.VerifiedGender;
import java.util.UUID;

public record UserProfileDto(
    UUID userId,
    String firstName,
    String phoneNumber,
    String profilePhotoUrl,
    UserRole role,
    VerificationStatus verificationStatus,
    VerifiedGender verifiedGender,
    boolean isPhoneVerified,
    ProfileVisibility profileVisibility,
    UserStatus status,
    Integer groupSessionCount,
    Integer noShowCount,
    Integer lateCancelCount, // <-- Added this field
    GymDto primaryGym
) {}