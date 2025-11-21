package com.sahbifit.api.user.dto;

import com.sahbifit.api.user.model.User;
import java.util.UUID;

// This DTO has NO relationships, so it can't cause a loop.
public record UserSummaryDto(
    UUID userId,
    String firstName,
    String profilePhotoUrl
) {
    public static UserSummaryDto fromEntity(User user) {
        if (user == null) return null;
        return new UserSummaryDto(
            user.getUserId(),
            user.getFirstName(),
            user.getProfilePhotoUrl()
        );
    }
}