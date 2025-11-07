// Pfad: src/main/java/com/sahbifit/api/gym/dto/GymSubmissionDto.java
package com.sahbifit.api.gym.dto;

import lombok.Data;

@Data
public class GymSubmissionDto {
    private String name;
    private String address;
    // We can add lat/lon here later if needed for Point mapping
}