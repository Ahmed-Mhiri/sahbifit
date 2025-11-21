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
import com.sahbifit.api.gym.dto.GymDto;
import com.sahbifit.api.gym.dto.GymSubmissionDto;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class GymController {

    private final GymService gymService;

    // --- SECTION 1: USER GYM MANAGEMENT ---
    
    /**
     * (Mobile App) Get all approved gyms.
     */
    @GetMapping("/gyms")
    // --- CHANGE HERE ---
    // @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')") // This was removed in the original plan
    public ResponseEntity<List<GymDto>> getApprovedGyms() {
        return ResponseEntity.ok(gymService.getApprovedGyms());
    }

    /**
     * (Mobile App) Submit a new gym for review.
     */
    @PostMapping("/gyms/submit")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<GymDto> submitGym(@RequestBody GymSubmissionDto dto, Principal principal) {
        GymDto submittedGym = gymService.submitGym(dto, principal.getName());
        return new ResponseEntity<>(submittedGym, HttpStatus.CREATED);
    }

    // --- SECTION 2: ADMIN GYM MANAGEMENT ---

    /**
     * (Admin Dashboard) Create a new, pre-approved gym.
     * Path: /api/admin/gyms
     */
    @PostMapping("/admin/gyms")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<GymDto> adminCreateGym(@RequestBody AdminGymDto dto) {
        GymDto createdGym = gymService.adminCreateGym(dto);
        return new ResponseEntity<>(createdGym, HttpStatus.CREATED);
    }

    /**
     * (Admin Dashboard) Approve a pending gym.
     * Path: /api/admin/gyms/{gymId}/approve
     */
    @PutMapping("/admin/gyms/{gymId}/approve")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<GymDto> adminApproveGym(@PathVariable UUID gymId) {
        GymDto approvedGym = gymService.adminApproveGym(gymId);
        return ResponseEntity.ok(approvedGym);
    }

    /**
     * (Admin Dashboard) Get ALL gyms (approved, pending, etc.)
     * Path: /api/admin/gyms
     */
    @GetMapping("/admin/gyms")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<GymDto>> adminGetAllGyms() {
        return ResponseEntity.ok(gymService.adminGetAllGyms());
    }

    /**
     * (Admin Dashboard) Get all PENDING gyms for review.
     * Path: /api/admin/gyms/pending
     */
    @GetMapping("/admin/gyms/pending")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<GymDto>> adminGetPendingGyms() {
        return ResponseEntity.ok(gymService.getPendingGyms());
    }

    /**
     * (Admin Dashboard) Update an existing gym.
     * Path: /api/admin/gyms/{gymId}
     */
    @PutMapping("/admin/gyms/{gymId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<GymDto> adminUpdateGym(@PathVariable UUID gymId, @RequestBody AdminGymDto dto) {
        GymDto updatedGym = gymService.adminUpdateGym(gymId, dto);
        return ResponseEntity.ok(updatedGym);
    }

    /**
     * (Admin Dashboard) Delete a gym (sets status to 'rejected').
     * Path: /api/admin/gyms/{gymId}
     */
    @DeleteMapping("/admin/gyms/{gymId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Void> adminDeleteGym(@PathVariable UUID gymId) {
        gymService.adminDeleteGym(gymId);
        return ResponseEntity.noContent().build();
    }
}