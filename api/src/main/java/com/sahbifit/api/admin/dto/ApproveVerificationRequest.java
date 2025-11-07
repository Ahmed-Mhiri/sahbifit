package com.sahbifit.api.admin.dto;

import java.util.UUID;

import com.sahbifit.api.model.enums.VerifiedGender;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApproveVerificationRequest {
    @NotNull
    private UUID userId;
    
    @NotNull
    private VerifiedGender verifiedGender;
}