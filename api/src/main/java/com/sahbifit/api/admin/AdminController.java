package com.sahbifit.api.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sahbifit.api.admin.dto.ApproveVerificationRequest;
import com.sahbifit.api.admin.dto.RejectVerificationRequest;
import com.sahbifit.api.admin.dto.VerificationQueueDto;

import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/admin/verification")
public class AdminController {

    @Autowired
    private AdminService adminService;

    /**
     * (Für Appsmith) Holt die Warteschlange der zu verifizierenden Benutzer.
     */
    @GetMapping("/queue")
    public ResponseEntity<List<VerificationQueueDto>> getQueue() {
        log.info("Admin abfrage Verifikations-Warteschlange");
        List<VerificationQueueDto> queue = adminService.getVerificationQueue();
        log.info("Gefunden {} Benutzer in der Warteschlange", queue.size());
        return ResponseEntity.ok(queue);
    }

    /**
     * (Für Appsmith) Genehmigt einen Benutzer.
     */
    @PutMapping("/approve")
    public ResponseEntity<?> approveUser(@Valid @RequestBody ApproveVerificationRequest request) {
        log.info("Admin genehmigt Benutzer: {}, Geschlecht: {}", 
                request.getUserId(), request.getVerifiedGender());
        
        adminService.approveVerification(request.getUserId(), request.getVerifiedGender());
        return ResponseEntity.ok("Benutzer genehmigt.");
    }

    /**
     * (Für Appsmith) Lehnt einen Benutzer ab.
     */
    @PutMapping("/reject")
    public ResponseEntity<?> rejectUser(@Valid @RequestBody RejectVerificationRequest request) {
        log.info("Admin lehnt Benutzer ab: {}, Grund: {}", 
                request.getUserId(), request.getReason());
        
        adminService.rejectVerification(request.getUserId(), request.getReason());
        return ResponseEntity.ok("Benutzer abgelehnt.");
    }
}