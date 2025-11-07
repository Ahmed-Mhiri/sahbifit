package com.sahbifit.api.user.dto;

import com.sahbifit.api.user.model.ProfileVisibility;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class UpdateVisibilityDto {
    @NotNull
    private ProfileVisibility visibility;
}