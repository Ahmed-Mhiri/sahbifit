package com.sahbifit.api.admin;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
// import com.sahbifit.api.report.model.Report; // <-- REMOVED
import com.sahbifit.api.report.dto.ReportDto;

import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/admin")
@PreAuthorize("hasRole('ADMIN')")
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
    public ResponseEntity<Void> approveUser(@Valid @RequestBody ApproveVerificationRequest request) {
        log.info("Admin approving user: {}, gender: {}", 
                request.userId(), request.verifiedGender()); // CHANGED: .userId() and .verifiedGender()
        
        adminService.approveVerification(request.userId(), request.verifiedGender()); // CHANGED
        return ResponseEntity.noContent().build();
    }

    @PutMapping("/verification/reject")
    public ResponseEntity<Void> rejectUser(@Valid @RequestBody RejectVerificationRequest request) {
        log.info("Admin rejecting user: {}, reason: {}", 
                request.userId(), request.reason()); // CHANGED: .userId() and .reason()
        
        adminService.rejectVerification(request.userId(), request.reason()); // CHANGED
        return ResponseEntity.noContent().build();
    }

    // --- SECTION 2: REPORTS (New Endpoints) ---
    @GetMapping("/reports/pending")
    public ResponseEntity<List<ReportDto>> getPendingReports() { // <-- CHANGED
        log.info("Admin fetching report queue");
        List<ReportDto> reports = adminService.getPendingReports(); // <-- CHANGED
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
}