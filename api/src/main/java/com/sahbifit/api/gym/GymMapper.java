package com.sahbifit.api.gym;

import com.sahbifit.api.gym.dto.GymDto;
import com.sahbifit.api.gym.model.Gym;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Handles mapping between Gym entities and Gym DTOs.
 *
 * This class follows a simple static method pattern and is not
 * managed by Spring, ensuring it's lightweight.
 */
public class GymMapper {

    /**
     * Converts a Gym @Entity to a GymDto.
     */
    public static GymDto toDto(Gym gym) {
        if (gym == null) {
            return null;
        }
        
        return new GymDto(
            gym.getGymId(),
            gym.getName(),
            gym.getAddress(),
            gym.getStatus(),
            gym.getMemberCount()
        );
    }

    /**
     * Helper to convert a list of entities to a list of DTOs.
     */
    public static List<GymDto> toDtoList(List<Gym> gyms) {
        return gyms.stream()
            .map(GymMapper::toDto)
            .collect(Collectors.toList());
    }
}