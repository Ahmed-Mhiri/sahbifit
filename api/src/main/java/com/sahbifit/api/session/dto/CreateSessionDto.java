package com.sahbifit.api.session.dto;

import java.time.OffsetDateTime;
import java.util.UUID;

import com.sahbifit.api.session.model.SessionType;

public record CreateSessionDto(
    UUID gymId,
    SessionType sessionType,
    String title,
    OffsetDateTime startTime,
    OffsetDateTime endTime,
    Integer maxParticipants
) {}