package com.sahbifit.api.report.dto;

import com.sahbifit.api.report.model.ReportPriority;
import com.sahbifit.api.report.model.ReportStatus;
import com.sahbifit.api.user.dto.UserSummaryDto;
import java.time.OffsetDateTime;
import java.util.UUID;

/**
 * A safe DTO for representing a Report in the admin panel.
 * Uses nested DTOs (UserSummaryDto) to prevent loops.
 */
public record ReportDto(
    UUID reportId,
    UserSummaryDto reportedBy,
    UserSummaryDto reportedUser,
    UUID sessionId,
    String reason,
    ReportPriority priority,
    ReportStatus status,
    OffsetDateTime createdAt
) {}