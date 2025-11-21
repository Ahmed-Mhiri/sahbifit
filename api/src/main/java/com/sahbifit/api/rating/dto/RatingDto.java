package com.sahbifit.api.rating.dto;

import com.sahbifit.api.session.dto.SessionSummaryDto;
import com.sahbifit.api.user.dto.UserSummaryDto;
import java.time.OffsetDateTime;
import java.util.UUID;

/**
 * A safe DTO for representing a Rating.
 * It uses nested DTOs (UserSummaryDto, SessionSummaryDto) to prevent loops.
 */
public record RatingDto(
    UUID ratingId,
    UserSummaryDto ratingBy,
    UserSummaryDto ratingFor,
    SessionSummaryDto session,
    Short ratingValue,
    String comment,
    OffsetDateTime createdAt
) {}