package com.sahbifit.api.rating.dto;

import java.util.UUID;

public record PendingRatingDto(
    UUID sessionId,
    String sessionTitle,
    UUID userIdToRate,
    String userNameToRate
) {}