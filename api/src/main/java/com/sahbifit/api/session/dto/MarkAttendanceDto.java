package com.sahbifit.api.session.dto;

import java.util.UUID;

import com.sahbifit.api.session.model.ParticipantStatus;

import jakarta.validation.constraints.NotNull;

public record MarkAttendanceDto(
    @NotNull(message = "sessionId cannot be null")
    UUID sessionId,

    @NotNull(message = "participantUserId cannot be null")
    UUID participantUserId,

    @NotNull(message = "newStatus cannot be null")
    ParticipantStatus newStatus
) {}