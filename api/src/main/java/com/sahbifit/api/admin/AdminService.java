package com.sahbifit.api.admin;

import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sahbifit.api.admin.dto.RejectionReason;
import com.sahbifit.api.admin.dto.VerificationQueueDto;
import com.sahbifit.api.exception.ResourceNotFoundException;
import com.sahbifit.api.external.push.PushNotificationService;
import com.sahbifit.api.external.storage.StorageService;
import com.sahbifit.api.report.model.Report;
import com.sahbifit.api.report.model.ReportStatus;
import com.sahbifit.api.report.repository.ReportRepository;
import com.sahbifit.api.user.model.User;
import com.sahbifit.api.user.model.UserStatus;
import com.sahbifit.api.user.repository.UserRepository;
import com.sahbifit.api.verification.model.VerificationStatus;
import com.sahbifit.api.verification.model.VerifiedGender;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private StorageService storageService; // For file deletion

    @Autowired
    private ReportRepository reportRepository;

    @Autowired
    private PushNotificationService pushNotificationService;

    /**
     * Retrieves all users waiting for verification.
     */
    public List<VerificationQueueDto> getVerificationQueue() {
        List<User> pendingUsers = userRepository.findByVerificationStatus(VerificationStatus.pending_review);

        return pendingUsers.stream().map(user -> {
            VerificationQueueDto dto = new VerificationQueueDto();
            dto.setUserId(user.getUserId());
            dto.setFirstName(user.getFirstName());
            dto.setProfilePhotoUrl(user.getProfilePhotoUrl());
            
            // Construct public URL from the stored key for admin dashboard
            String publicUrl = storageService.generatePublicUrl(user.getVerificationVideoUrl());
            dto.setVerificationVideoUrl(publicUrl);
            
            // FIX: Remove the atOffset() call since updatedAt is already OffsetDateTime
            dto.setSubmittedAt(user.getUpdatedAt());
            
            return dto;
        }).collect(Collectors.toList());
    }

    /**
     * Approves a user and sets their gender.
     */
    @Transactional
    public void approveVerification(UUID userId, VerifiedGender gender) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "userId", userId));

        if (user.getVerificationStatus() != VerificationStatus.pending_review) {
            throw new IllegalStateException("User is not waiting for approval.");
        }

        // ✅ Store old video key before clearing it
        String oldVideoKey = user.getVerificationVideoUrl();

        user.setVerificationStatus(VerificationStatus.verified);
        user.setVerifiedGender(gender);
        
        // ✅ UNCOMMENTED: Delete video URL for data protection
        user.setVerificationVideoUrl(null); 

        userRepository.save(user);

        // ✅ Delete the actual file from storage using the key
        if (oldVideoKey != null) {
            try {
                storageService.deleteFile(oldVideoKey);
                log.info("Verification video deleted for user: {}", userId);
            } catch (IOException e) {
                log.error("Error deleting verification video for user {}: {}", userId, e.getMessage());
                // Don't throw exception - the user is still approved, just log the error
            }
        }

        log.info("User {} has been verified. Gender: {}", userId, gender);

        // Send push notification
        pushNotificationService.sendVerificationApproved(user);
    }

    /**
     * Rejects a user for a specific reason.
     */
    @Transactional
    public void rejectVerification(UUID userId, RejectionReason reason) {
        // Map the safe DTO enum to the persistent enum
        VerificationStatus verificationStatus;
        switch (reason) {
            case BAD_VIDEO:
                verificationStatus = VerificationStatus.rejected_bad_video;
                break;
            case MISMATCH:
                verificationStatus = VerificationStatus.rejected_mismatch;
                break;
            default:
                // This case should be impossible due to @NotNull
                throw new IllegalArgumentException("Invalid rejection reason.");
        }

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "userId", userId));

        if (user.getVerificationStatus() != VerificationStatus.pending_review) {
            throw new IllegalStateException("User is not waiting for approval.");
        }

        // ✅ Store old video key before clearing it
        String oldVideoKey = user.getVerificationVideoUrl();

        user.setVerificationStatus(verificationStatus); // Use the mapped variable
        user.setVerificationVideoUrl(null); // Delete reference

        userRepository.save(user);

        // ✅ Delete the actual file from storage using the key
        if (oldVideoKey != null) {
            try {
                storageService.deleteFile(oldVideoKey);
                log.info("Verification video deleted for rejected user: {}", userId);
            } catch (IOException e) {
                log.error("Error deleting verification video for rejected user {}: {}", userId, e.getMessage());
                // Don't throw exception - the rejection still proceeds
            }
        }

        log.info("User {} has been rejected. Reason: {}", userId, verificationStatus);

        // Send push notification about rejection
        pushNotificationService.sendVerificationRejected(user, verificationStatus);
    }

    /**
     * (For Appsmith) Bans a user (status = banned).
     */
    @Transactional
    public void banUser(UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "userId", userId));

        user.setStatus(UserStatus.banned);
        userRepository.save(user);

        log.warn("Admin has banned user {}.", userId);
    }

    /**
     * (For Appsmith) Retrieves the queue of reported users.
     */
    public List<Report> getPendingReports() {
        return reportRepository.findByStatusOrderByPriorityDesc(ReportStatus.pending);
    }
}