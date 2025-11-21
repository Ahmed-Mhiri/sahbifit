package com.sahbifit.api.session.dto;

import com.sahbifit.api.session.model.ParticipantStatus;
import com.sahbifit.api.user.dto.UserSummaryDto;
import java.time.OffsetDateTime;

public record SessionParticipantDto(
    UserSummaryDto user,
    ParticipantStatus status,
    OffsetDateTime joinedAt
) {}