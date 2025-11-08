package com.sahbifit.api.admin.dto;

import java.util.UUID;
import jakarta.validation.constraints.NotNull;

public record RejectVerificationRequest(
    @NotNull
    UUID userId,
    
    @NotNull
    RejectionReason reason
) {}