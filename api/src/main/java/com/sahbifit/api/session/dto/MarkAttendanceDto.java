package com.sahbifit.api.session.dto;

import java.util.UUID;

import com.sahbifit.api.session.model.ParticipantStatus;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MarkAttendanceDto {

    @NotNull(message = "sessionId cannot be null")
    private UUID sessionId;

    @NotNull(message = "participantUserId cannot be null")
    private UUID participantUserId;

    @NotNull(message = "newStatus cannot be null")
    private ParticipantStatus newStatus;
}