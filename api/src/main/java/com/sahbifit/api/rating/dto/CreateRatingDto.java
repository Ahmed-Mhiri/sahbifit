// Path: src/main/java/com/sahbifit/api/rating/dto/CreateRatingDto.java
package com.sahbifit.api.rating.dto;

import java.util.UUID;

import lombok.Data;

/**
 * DTO for creating a new rating.
 * (MVP 5.1)
 */
@Data
public class CreateRatingDto {

    // The session in which the rating took place
    private UUID sessionId;

    // The user who is BEING rated
    private UUID ratedUserId;

    // The rating value (e.g., 1-5)
    private Short ratingValue;

    // An optional comment
    private String comment;
}