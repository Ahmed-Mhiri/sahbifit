package com.sahbifit.api.gym.dto;

import com.sahbifit.api.gym.model.GymStatus;
import java.util.UUID;

/**
 * A Data Transfer Object for public Gym information.
 * This is a flat object with no relationships to prevent JSON loops.
 * Mapping logic is in GymMapper.
 */
public record GymDto(
    UUID gymId,
    String name,
    String address,
    GymStatus status,
    int memberCount // This comes from the @Formula in your Gym entity
) {
    // Mapping logic has been moved to GymMapper.java
}