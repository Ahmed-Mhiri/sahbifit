package com.sahbifit.api.user.dto;

import lombok.Data;
import jakarta.validation.constraints.NotBlank;

@Data
public class UpdateFcmTokenDto {
    @NotBlank
    private String fcmToken;
}