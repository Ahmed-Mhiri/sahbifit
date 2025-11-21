package com.sahbifit.api.user;

import com.sahbifit.api.gym.GymMapper;
import com.sahbifit.api.user.dto.UserProfileDto;
import com.sahbifit.api.user.dto.UserSummaryDto;
import com.sahbifit.api.user.model.User;

public class UserMapper {

    public static UserSummaryDto toSummaryDto(User user) {
        if (user == null) {
            return null;
        }
        
        return new UserSummaryDto(
            user.getUserId(),
            user.getFirstName(),
            user.getProfilePhotoUrl()
        );
    }
    
    public static UserProfileDto toProfileDto(User user) {
        if (user == null) return null;
        
        return new UserProfileDto(
            user.getUserId(),
            user.getFirstName(),
            user.getPhoneNumber(),
            user.getProfilePhotoUrl(),
            user.getRole(),
            user.getVerificationStatus(),
            user.getVerifiedGender(),
            user.isPhoneVerified(),
            user.getProfileVisibility(),
            user.getStatus(),
            user.getGroupSessionCount(),
            user.getNoShowCount(),
            user.getLateCancelCount(), // <-- Mapped here
            GymMapper.toDto(user.getPrimaryGym())
        );
    }
}