package com.sahbifit.api.admin.dto;

import java.time.OffsetDateTime;
import java.util.UUID;

public record VerificationQueueDto(
    UUID userId,
    String firstName,
    String profilePhotoUrl,
    String verificationVideoUrl,
    OffsetDateTime submittedAt
) {}