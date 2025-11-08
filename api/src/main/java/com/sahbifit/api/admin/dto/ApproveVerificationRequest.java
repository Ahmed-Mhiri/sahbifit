package com.sahbifit.api.admin.dto;

import java.util.UUID;
import com.sahbifit.api.verification.model.VerifiedGender;
import jakarta.validation.constraints.NotNull;

public record ApproveVerificationRequest(
    @NotNull
    UUID userId,
    
    @NotNull
    VerifiedGender verifiedGender
) {}