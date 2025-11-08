package com.sahbifit.api.verification.dto;

import com.sahbifit.api.verification.model.VerificationStatus;
import com.sahbifit.api.verification.model.VerifiedGender;

public record VerificationStatusDto(
    VerificationStatus status,
    VerifiedGender gender
) {}