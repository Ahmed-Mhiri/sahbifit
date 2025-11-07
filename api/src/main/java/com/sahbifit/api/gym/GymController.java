// Pfad: src/main/java/com/sahbifit/api/gym/GymController.java
package com.sahbifit.api.gym;

import java.security.Principal;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sahbifit.api.gym.dto.AdminGymDto;
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

    /**
     * (Admin Dashboard) Create a new, pre-approved gym.
     */
    @PostMapping("/admin/gyms")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Gym> adminCreateGym(@RequestBody AdminGymDto dto) {
        Gym createdGym = gymService.adminCreateGym(dto);
        return new ResponseEntity<>(createdGym, HttpStatus.CREATED);
    }

    /**
     * (Admin Dashboard) Approve a pending gym.
     */
    @PutMapping("/admin/gyms/{gymId}/approve")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Gym> adminApproveGym(@PathVariable UUID gymId) {
        Gym approvedGym = gymService.adminApproveGym(gymId);
        return ResponseEntity.ok(approvedGym);
    }

    /**
     * (Admin Dashboard) Get ALL gyms (approved, pending, etc.)
     */
    @GetMapping("/admin/gyms")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<Gym>> adminGetAllGyms() {
        return ResponseEntity.ok(gymService.adminGetAllGyms());
    }

    /**
     * (Admin Dashboard) Update an existing gym.
     */
    @PutMapping("/admin/gyms/{gymId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Gym> adminUpdateGym(@PathVariable UUID gymId, @RequestBody AdminGymDto dto) {
        Gym updatedGym = gymService.adminUpdateGym(gymId, dto);
        return ResponseEntity.ok(updatedGym);
    }

    /**
     * (Admin Dashboard) Delete a gym (sets status to 'rejected').
     */
    @DeleteMapping("/admin/gyms/{gymId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Void> adminDeleteGym(@PathVariable UUID gymId) {
        gymService.adminDeleteGym(gymId);
        return ResponseEntity.noContent().build();
    }
}