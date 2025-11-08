// Path: src/main/java/com/sahbifit/api/rating/dto/CreateRatingDto.java
package com.sahbifit.api.rating.dto;

import java.util.UUID;

/**
 * DTO for creating a new rating.
 * (MVP 5.1)
 */
public record CreateRatingDto(
    // The session in which the rating took place
    UUID sessionId,
    
    // The user who is BEING rated
    UUID ratedUserId,
    
    // The rating value (e.g., 1-5)
    Short ratingValue,
    
    // An optional comment
    String comment
) {}