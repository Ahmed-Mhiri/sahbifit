package com.sahbifit.api.session.dto;

import com.sahbifit.api.session.model.Session;
import java.time.OffsetDateTime;
import java.util.UUID;

/**
 * A minimal, safe DTO for representing a Session,
 * used inside other DTOs like RatingDto to prevent loops.
 */
public record SessionSummaryDto(
    UUID sessionId,
    String title,
    OffsetDateTime startTime
) {
    public static SessionSummaryDto fromEntity(Session session) {
        if (session == null) return null;
        
        return new SessionSummaryDto(
            session.getSessionId(),
            session.getTitle(),
            session.getStartTime()
        );
    }
}