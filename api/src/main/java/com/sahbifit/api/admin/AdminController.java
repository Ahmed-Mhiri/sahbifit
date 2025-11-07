package com.sahbifit.api.admin;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.sahbifit.api.admin.dto.ApproveVerificationRequest;
import com.sahbifit.api.admin.dto.RejectVerificationRequest;
import com.sahbifit.api.admin.dto.VerificationQueueDto;
import com.sahbifit.api.gym.GymService;
import com.sahbifit.api.gym.dto.AdminGymDto;
import com.sahbifit.api.gym.model.Gym;
import com.sahbifit.api.report.model.Report;

import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private GymService gymService;

    // --- SECTION 1: VERIFICATION (Existing Endpoints) ---
    @GetMapping("/verification/queue")
    public ResponseEntity<List<VerificationQueueDto>> getQueue() {
        log.info("Admin fetching verification queue");
        List<VerificationQueueDto> queue = adminService.getVerificationQueue();
        log.info("Found {} users in queue", queue.size());
        return ResponseEntity.ok(queue);
    }

    @PutMapping("/verification/approve")
    public ResponseEntity<Void> approveUser(@Valid @RequestBody ApproveVerificationRequest request) {
        log.info("Admin approving user: {}, gender: {}", 
                request.getUserId(), request.getVerifiedGender());
        
        adminService.approveVerification(request.getUserId(), request.getVerifiedGender());
        return ResponseEntity.noContent().build();
    }

    @PutMapping("/verification/reject")
    public ResponseEntity<Void> rejectUser(@Valid @RequestBody RejectVerificationRequest request) {
        log.info("Admin rejecting user: {}, reason: {}", 
                request.getUserId(), request.getReason());
        
        adminService.rejectVerification(request.getUserId(), request.getReason());
        return ResponseEntity.noContent().build();
    }

    // --- SECTION 2: REPORTS (New Endpoints) ---
    @GetMapping("/reports/pending")
    public ResponseEntity<List<Report>> getPendingReports() {
        log.info("Admin fetching report queue");
        List<Report> reports = adminService.getPendingReports();
        log.info("Found {} reports in queue", reports.size());
        return ResponseEntity.ok(reports);
    }

    // --- SECTION 3: USER MANAGEMENT (New Endpoints) ---
    @PostMapping("/users/{userId}/ban")
    public ResponseEntity<Void> banUser(@PathVariable UUID userId) {
        log.info("Admin banning user: {}", userId);
        adminService.banUser(userId);
        return ResponseEntity.noContent().build();
    }

    // --- SECTION 4: GYM MANAGEMENT (Moved from GymController) ---
    
    /**
     * (Admin Dashboard) Create a new, pre-approved gym.
     */
    @PostMapping("/gyms")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Gym> adminCreateGym(@RequestBody AdminGymDto dto) {
        Gym createdGym = gymService.adminCreateGym(dto);
        return new ResponseEntity<>(createdGym, HttpStatus.CREATED);
    }

    /**
     * (Admin Dashboard) Approve a pending gym.
     */
    @PutMapping("/gyms/{gymId}/approve")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Gym> adminApproveGym(@PathVariable UUID gymId) {
        Gym approvedGym = gymService.adminApproveGym(gymId);
        return ResponseEntity.ok(approvedGym);
    }

    /**
     * (Admin Dashboard) Get ALL gyms (approved, pending, etc.)
     */
    @GetMapping("/gyms")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<Gym>> adminGetAllGyms() {
        return ResponseEntity.ok(gymService.adminGetAllGyms());
    }

    /**
     * (Admin Dashboard) Get all PENDING gyms for review.
     */
    @GetMapping("/gyms/pending")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<Gym>> adminGetPendingGyms() {
        return ResponseEntity.ok(gymService.getPendingGyms());
    }

    /**
     * (Admin Dashboard) Update an existing gym.
     */
    @PutMapping("/gyms/{gymId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Gym> adminUpdateGym(@PathVariable UUID gymId, @RequestBody AdminGymDto dto) {
        Gym updatedGym = gymService.adminUpdateGym(gymId, dto);
        return ResponseEntity.ok(updatedGym);
    }

    /**
     * (Admin Dashboard) Delete a gym (sets status to 'rejected').
     */
    @DeleteMapping("/gyms/{gymId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Void> adminDeleteGym(@PathVariable UUID gymId) {
        gymService.adminDeleteGym(gymId);
        return ResponseEntity.noContent().build();
    }
}