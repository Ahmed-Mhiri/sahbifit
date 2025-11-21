package com.sahbifit.api.session.dto;

import com.sahbifit.api.gym.dto.GymDto;
import com.sahbifit.api.session.model.SessionType;
import com.sahbifit.api.user.dto.UserSummaryDto;

import java.time.OffsetDateTime;
import java.util.UUID;

/**
 * DTO for representing a Session in a public feed or list.
 * It uses nested DTOs (UserSummaryDto, GymDto) to prevent loops.
 */
public record SessionFeedDto(
    UUID sessionId,
    String title,
    OffsetDateTime startTime,
    OffsetDateTime endTime,
    SessionType sessionType,
    int participantCount,
    int maxParticipants,
    
    // Nested DTOs - Guaranteed safe from loops
    UserSummaryDto creator,
    GymDto gym,

    // Chat status
    boolean isChatActive
) {}