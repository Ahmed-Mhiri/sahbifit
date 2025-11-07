package com.sahbifit.api.session.dto;
import java.time.OffsetDateTime;
import java.util.UUID;

import com.sahbifit.api.session.model.SessionType;

import lombok.Data;

@Data
public class CreateSessionDto {
    private UUID gymId;
    private SessionType sessionType;
    private String title;
    private OffsetDateTime startTime;
    private OffsetDateTime endTime;
    private Integer maxParticipants;
}