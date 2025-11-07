package com.sahbifit.api.admin;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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

    // --- SECTION 1: VERIFICATION (Existing Endpoints) ---
    @GetMapping("/verification/queue")
    public ResponseEntity<List<VerificationQueueDto>> getQueue() {
        log.info("Admin fetching verification queue");
        List<VerificationQueueDto> queue = adminService.getVerificationQueue();
        log.info("Found {} users in queue", queue.size());
        return ResponseEntity.ok(queue);
    }

    @PutMapping("/verification/approve")
    public ResponseEntity<?> approveUser(@Valid @RequestBody ApproveVerificationRequest request) {
        log.info("Admin approving user: {}, gender: {}", 
                request.getUserId(), request.getVerifiedGender());
        
        adminService.approveVerification(request.getUserId(), request.getVerifiedGender());
        return ResponseEntity.ok("User approved.");
    }

    @PutMapping("/verification/reject")
    public ResponseEntity<?> rejectUser(@Valid @RequestBody RejectVerificationRequest request) {
        log.info("Admin rejecting user: {}, reason: {}", 
                request.getUserId(), request.getReason());
        
        adminService.rejectVerification(request.getUserId(), request.getReason());
        return ResponseEntity.ok("User rejected.");
    }

    // --- SECTION 2: REPORTS (New Endpoints) ---
    @GetMapping("/reports/pending")
    public ResponseEntity<List<Report>> getPendingReports() {
        log.info("Admin fetching report queue");
        List<Report> reports = adminService.getPendingReports();
        log.info("Found {} reports in queue", reports.size());
        return ResponseEntity.ok(reports);
    }
    

    // --- SECTION 3: GYM SUBMISSIONS (New Endpoints) ---
    @GetMapping("/gyms/pending")
    public ResponseEntity<List<Gym>> getPendingGyms() {
        log.info("Admin fetching gym queue");
        List<Gym> gyms = adminService.getPendingGyms();
        log.info("Found {} gyms in queue", gyms.size());
        return ResponseEntity.ok(gyms);
    }

    // --- SECTION 4: USER MANAGEMENT (New Endpoints) ---
    @PostMapping("/users/{userId}/ban")
    public ResponseEntity<?> banUser(@PathVariable UUID userId) {
        log.info("Admin banning user: {}", userId);
        adminService.banUser(userId);
        return ResponseEntity.ok("User banned.");
    }
}