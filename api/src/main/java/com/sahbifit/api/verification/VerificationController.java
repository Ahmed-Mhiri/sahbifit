package com.sahbifit.api.verification;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sahbifit.api.verification.dto.VerificationStatusDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/verification")
public class VerificationController {

    @Autowired
    private VerificationService verificationService;

    /**
     * Endpoint for submitting verification video.
     */
    @PostMapping("/submit")
    public ResponseEntity<?> submitVideo(
            @AuthenticationPrincipal UserDetails userDetails,
            @RequestParam("video") MultipartFile videoFile) {

        String userPhoneNumber = userDetails.getUsername();
        log.info("Video upload request from user: {}", userPhoneNumber);

        try {
            // 1. Validation: File is not empty
            if (videoFile.isEmpty()) {
                log.warn("Empty file from user: {}", userPhoneNumber);
                return ResponseEntity.badRequest().body("The video file is empty.");
            }

            // ✅ IMPROVED: Allow multiple video types for better UX
            String contentType = videoFile.getContentType();
            if (contentType == null || !contentType.startsWith("video/")) {
                log.warn("Invalid file type from user: {}, Type: {}", userPhoneNumber, contentType);
                return ResponseEntity.badRequest().body("Only video files are allowed.");
            }

            // ✅ OPTIONAL: More specific validation if needed
            List<String> allowedTypes = Arrays.asList("video/mp4", "video/quicktime", "video/webm", "video/x-msvideo");
            if (!allowedTypes.contains(contentType)) {
                log.warn("Unsupported video type from user: {}, Type: {}", userPhoneNumber, contentType);
                return ResponseEntity.badRequest().body("Only MP4, MOV, WebM and AVI video files are allowed.");
            }

            // ✅ REMOVED: File size validation (now handled by Spring configuration)
            // File size validation is now centralized via application.properties
            // spring.servlet.multipart.max-file-size=100MB
            // spring.servlet.multipart.max-request-size=100MB

            // 4. Processing
            verificationService.submitVerificationVideo(userPhoneNumber, videoFile);
            
            log.info("Video successfully processed for user: {}", userPhoneNumber);
            return ResponseEntity.ok("Video successfully submitted. Verification is pending.");

        } catch (IllegalStateException e) {
            log.warn("Invalid status for video upload from user: {}, Error: {}", userPhoneNumber, e.getMessage());
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            log.error("Error during video upload for user: {}", userPhoneNumber, e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Upload error: " + e.getMessage());
        }
    }

    /**
     * Endpoint for the app to query user status
     * (e.g., to display the "Probationary Mode" UI).
     */
    @GetMapping("/status")
    public ResponseEntity<VerificationStatusDto> getStatus(@AuthenticationPrincipal UserDetails userDetails) {
        String userPhoneNumber = userDetails.getUsername();
        
        try {
            VerificationStatusDto statusDto = verificationService.getVerificationStatus(userPhoneNumber);
            log.debug("Status query for user: {}, Status: {}", userPhoneNumber, statusDto.getStatus());
            return ResponseEntity.ok(statusDto);
        } catch (Exception e) {
            log.error("Error during status query for user: {}", userPhoneNumber, e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}