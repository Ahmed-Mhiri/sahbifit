package com.sahbifit.api.user.dto;

import com.sahbifit.api.user.model.ProfileVisibility;

import jakarta.validation.constraints.NotNull;

public record UpdateVisibilityDto(
    @NotNull
    ProfileVisibility visibility
) {}