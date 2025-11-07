package com.sahbifit.api.report.dto;

import java.util.UUID;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateReportDto {

    @NotNull(message = "reportedUserId cannot be null")
    private UUID reportedUserId;

    @NotBlank(message = "Reason cannot be empty")
    private String reason;

    private UUID sessionId;
}