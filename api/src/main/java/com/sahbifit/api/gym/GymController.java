package com.sahbifit.api.gym;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sahbifit.api.gym.dto.GymSubmissionDto;
import com.sahbifit.api.gym.model.Gym;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class GymController {

    private final GymService gymService;

    /**
     * (Mobile App) Get all approved gyms.
     */
    @GetMapping("/gyms")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<List<Gym>> getApprovedGyms() {
        return ResponseEntity.ok(gymService.getApprovedGyms());
    }

    /**
     * (Mobile App) Submit a new gym for review.
     */
    @PostMapping("/gyms/submit")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<Gym> submitGym(@RequestBody GymSubmissionDto dto, Principal principal) {
        Gym submittedGym = gymService.submitGym(dto, principal.getName());
        return new ResponseEntity<>(submittedGym, HttpStatus.CREATED);
    }
}