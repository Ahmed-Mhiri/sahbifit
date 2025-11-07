package com.sahbifit.api.rating.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import java.util.UUID;

@Data
@AllArgsConstructor
public class PendingRatingDto {
    private UUID sessionId;
    private String sessionTitle;
    private UUID userIdToRate;
    private String userNameToRate;
}