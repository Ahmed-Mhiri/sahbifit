// Path: src/main/java/com/sahbifit/api/rating/RatingController.java
package com.sahbifit.api.rating;

import java.security.Principal;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sahbifit.api.rating.dto.CreateRatingDto;
import com.sahbifit.api.rating.dto.PendingRatingDto;
import com.sahbifit.api.rating.model.Rating;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/ratings")
@RequiredArgsConstructor
public class RatingController {

    private final RatingService ratingService;

    /**
     * (MVP 5.1) Creates a new rating for a user after a session.
     */
    @PostMapping
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<Rating> createRating(@RequestBody CreateRatingDto dto, Principal principal) {
        // principal.getName() contains the phone number of the logged-in user (the rater)
        Rating newRating = ratingService.createRating(dto, principal.getName());
        return new ResponseEntity<>(newRating, HttpStatus.CREATED);
    }

    /**
     * (Optional) Retrieves all received ratings for a user profile.
     */
    @GetMapping("/user/{userId}")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR', 'ADMIN')") // Anyone can view profile ratings
    public ResponseEntity<List<Rating>> getRatingsForUser(@PathVariable UUID userId) {
        List<Rating> ratings = ratingService.getRatingsForUser(userId);
        return ResponseEntity.ok(ratings);
    }

    @GetMapping("/pending")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<List<PendingRatingDto>> getPendingRatings(Principal principal) {
        List<PendingRatingDto> pendingRatings = ratingService.getPendingRatings(principal.getName());
        return ResponseEntity.ok(pendingRatings);
    }
}