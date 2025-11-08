package com.sahbifit.api.report.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.util.UUID;

public record CreateReportDto(
    @NotNull(message = "reportedUserId cannot be null")
    UUID reportedUserId,
    
    @NotBlank(message = "Reason cannot be empty")
    String reason,
    
    UUID sessionId
) {}