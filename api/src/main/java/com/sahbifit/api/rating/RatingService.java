// Path: src/main/java/com/sahbifit/api/rating/RatingService.java
package com.sahbifit.api.rating;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sahbifit.api.exception.ResourceNotFoundException;
import com.sahbifit.api.rating.dto.CreateRatingDto;
import com.sahbifit.api.rating.dto.PendingRatingDto;
import com.sahbifit.api.rating.model.Rating;
import com.sahbifit.api.rating.repository.RatingRepository;
import com.sahbifit.api.session.model.Session;
import com.sahbifit.api.session.model.SessionParticipantId;
import com.sahbifit.api.session.repository.SessionParticipantRepository;
import com.sahbifit.api.session.repository.SessionRepository;
import com.sahbifit.api.user.model.User;
import com.sahbifit.api.user.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class RatingService {

    private final RatingRepository ratingRepository;
    private final UserRepository userRepository;
    private final SessionRepository sessionRepository; // Required to find the session
    private final SessionParticipantRepository sessionParticipantRepository;

    /**
     * (MVP 5.1) Creates a new rating of one user for another
     * after a shared session.
     */
    public Rating createRating(CreateRatingDto dto, String raterPhoneNumber) {
        // 1. Find user and session
        User raterUser = userRepository.findByPhoneNumber(raterPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("Rater (User) not found"));

        User ratedUser = userRepository.findById(dto.ratedUserId())
                .orElseThrow(() -> new ResourceNotFoundException("Rated User not found"));

        Session session = sessionRepository.findById(dto.sessionId())
                .orElseThrow(() -> new ResourceNotFoundException("Session not found"));

        // Validation 0 (Rating yourself)
        if (raterUser.getUserId().equals(ratedUser.getUserId())) {
            throw new IllegalStateException("You cannot rate yourself.");
        }

        // Validation 1 (Participation)
        SessionParticipantId raterId = new SessionParticipantId();
        raterId.setSessionId(dto.sessionId());
        raterId.setUserId(raterUser.getUserId());

        SessionParticipantId ratedId = new SessionParticipantId();
        ratedId.setSessionId(dto.sessionId());
        ratedId.setUserId(dto.ratedUserId());

        if (!sessionParticipantRepository.existsById(raterId) || !sessionParticipantRepository.existsById(ratedId)) {
            throw new IllegalStateException("Both users must have participated in this session to rate each other.");
        }

        // Validation 2 (Duplicate rating)
        boolean alreadyExists = ratingRepository.existsBySessionSessionIdAndRatingByUserIdAndRatingForUserId(
                dto.sessionId(),
                raterUser.getUserId(),
                dto.ratedUserId()
        );

        if (alreadyExists) {
            throw new IllegalStateException("You have already rated this user for this session.");
        }

        // 3. Create and save rating
        Rating newRating = new Rating();
        newRating.setSession(session);
        newRating.setRatingBy(raterUser);
        newRating.setRatingFor(ratedUser);
        newRating.setRatingValue(dto.ratingValue());
        newRating.setComment(dto.comment()); // Can be null

        return ratingRepository.save(newRating);
    }

    /**
     * (Optional) Retrieves all received ratings for a user.
     */
    @Transactional(readOnly = true)
    public List<Rating> getRatingsForUser(UUID userId) {
        // Ensure user exists before retrieving ratings
        if (!userRepository.existsById(userId)) {
            throw new ResourceNotFoundException("User not found");
        }
        return ratingRepository.findByRatingForUserId(userId);
    }

    /**
     * (MVP 5.2) Gets a list of users/sessions that the current user
     * has attended but not yet rated - OPTIMIZED VERSION
     */
    @Transactional(readOnly = true)
    public List<PendingRatingDto> getPendingRatings(String raterPhoneNumber) {
        // Validate user exists
        if (!userRepository.existsByPhoneNumber(raterPhoneNumber)) {
            throw new ResourceNotFoundException("Rater (User) not found");
        }
        
        // Single query to get all pending ratings
        return ratingRepository.findPendingRatings(raterPhoneNumber);
    }
}