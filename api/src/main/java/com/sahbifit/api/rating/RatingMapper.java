package com.sahbifit.api.rating;

import com.sahbifit.api.rating.dto.RatingDto;
import com.sahbifit.api.rating.model.Rating;
import com.sahbifit.api.session.dto.SessionSummaryDto;
import com.sahbifit.api.user.UserMapper;

import java.util.List;
import java.util.stream.Collectors;

public class RatingMapper {

    public static RatingDto toDto(Rating rating) {
        if (rating == null) {
            return null;
        }

        return new RatingDto(
            rating.getRatingId(),
            UserMapper.toSummaryDto(rating.getRatingBy()),
            UserMapper.toSummaryDto(rating.getRatingFor()),
            SessionSummaryDto.fromEntity(rating.getSession()),
            rating.getRatingValue(),
            rating.getComment(),
            rating.getCreatedAt()
        );
    }

    public static List<RatingDto> toDtoList(List<Rating> ratings) {
        return ratings.stream()
            .map(RatingMapper::toDto)
            .collect(Collectors.toList());
    }
}