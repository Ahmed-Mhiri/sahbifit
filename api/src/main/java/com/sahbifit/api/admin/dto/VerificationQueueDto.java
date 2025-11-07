package com.sahbifit.api.admin.dto;

import java.time.OffsetDateTime;
import java.util.UUID;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VerificationQueueDto {
    private UUID userId;
    private String firstName;
    private String profilePhotoUrl;
    private String verificationVideoUrl;
    private OffsetDateTime submittedAt;
}