// Path: src/main/java/com/sahbifit/api/rating/repository/RatingRepository.java
package com.sahbifit.api.rating.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sahbifit.api.rating.dto.PendingRatingDto;
import com.sahbifit.api.rating.model.Rating;
import com.sahbifit.api.user.model.User;

@Repository
public interface RatingRepository extends JpaRepository<Rating, UUID> {

    /**
     * Checks if a user has already rated another user for a specific session.
     * Required by RatingService.createRating() (validation 2).
     */
    boolean existsBySessionSessionIdAndRatingByUserIdAndRatingForUserId(UUID sessionId, UUID raterId, UUID ratedId);

    /**
     * (Optional) Retrieves all ratings a user has received.
     * Required by RatingService.getRatingsForUser().
     */
    List<Rating> findByRatingForUserId(UUID ratedUserId);

    List<Rating> findByRatingBy(User user);

    // Add this method to RatingRepository.java
    @Query("""
        SELECT new com.sahbifit.api.rating.dto.PendingRatingDto(
            sp.session.sessionId, 
            sp.session.title, 
            op.user.userId, 
            op.user.firstName
        )
        FROM SessionParticipant sp
        JOIN SessionParticipant op ON sp.session = op.session
        WHERE sp.user.phoneNumber = :userPhoneNumber
        AND sp.status = 'attended'
        AND op.user.userId != sp.user.userId
        AND op.status = 'attended'
        AND NOT EXISTS (
            SELECT 1 FROM Rating r 
            WHERE r.session = sp.session 
            AND r.ratingBy = sp.user 
            AND r.ratingFor = op.user
        )
        ORDER BY sp.session.startTime DESC
    """)
    List<PendingRatingDto> findPendingRatings(@Param("userPhoneNumber") String userPhoneNumber);
}