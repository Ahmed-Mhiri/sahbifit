package com.sahbifit.api.user.dto;

import jakarta.validation.constraints.NotBlank;

public record UpdateFcmTokenDto(
    @NotBlank
    String fcmToken
) {}