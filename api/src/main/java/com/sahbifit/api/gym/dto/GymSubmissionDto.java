package com.sahbifit.api.gym.dto;

public record GymSubmissionDto(
    String name,
    String address
    // We can add lat/lon here later if needed for Point mapping
) {}