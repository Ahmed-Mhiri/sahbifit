package com.sahbifit.api.admin.dto;

import java.util.UUID;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RejectVerificationRequest {
    @NotNull
    private UUID userId;
    
    @NotNull
    private RejectionReason reason;      // WITH THIS
}