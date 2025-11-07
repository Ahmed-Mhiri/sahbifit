package com.sahbifit.api.admin;

import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sahbifit.api.admin.dto.VerificationQueueDto;
import com.sahbifit.api.external.storage.StorageService;
import com.sahbifit.api.model.enums.VerificationStatus;
import com.sahbifit.api.model.enums.VerifiedGender;
import com.sahbifit.api.user.model.User;
import com.sahbifit.api.user.repository.UserRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private StorageService storageService; // For file deletion

    // Optional: Für spätere Push-Benachrichtigungen
    // @Autowired
    // private PushNotificationService pushNotificationService;

    /**
     * Holt alle Benutzer, die auf Verifizierung warten.
     */
    public List<VerificationQueueDto> getVerificationQueue() {
        List<User> pendingUsers = userRepository.findByVerificationStatus(VerificationStatus.pending_review);

        return pendingUsers.stream().map(user -> {
            VerificationQueueDto dto = new VerificationQueueDto();
            dto.setUserId(user.getUserId());
            dto.setFirstName(user.getFirstName());
            dto.setProfilePhotoUrl(user.getProfilePhotoUrl());
            dto.setVerificationVideoUrl(user.getVerificationVideoUrl());
            
            // FIX: Remove the atOffset() call since updatedAt is already OffsetDateTime
            dto.setSubmittedAt(user.getUpdatedAt());
            
            return dto;
        }).collect(Collectors.toList());
    }

    /**
     * Genehmigt einen Benutzer und setzt sein Geschlecht.
     */
    @Transactional
    public void approveVerification(UUID userId, VerifiedGender gender) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("Benutzer nicht gefunden."));

        if (user.getVerificationStatus() != VerificationStatus.pending_review) {
            throw new IllegalStateException("Benutzer wartet nicht auf Genehmigung.");
        }

        // ✅ Store old video URL before clearing it
        String oldVideoUrl = user.getVerificationVideoUrl();

        user.setVerificationStatus(VerificationStatus.verified);
        user.setVerifiedGender(gender);
        
        // ✅ UNCOMMENTED: Delete video URL for data protection
        user.setVerificationVideoUrl(null); 

        userRepository.save(user);

        // ✅ NEW: Delete the actual file from storage
        if (oldVideoUrl != null) {
            try {
                storageService.deleteFile(oldVideoUrl);
                log.info("Verifizierungsvideo gelöscht für Benutzer: {}", userId);
            } catch (IOException e) {
                log.error("Fehler beim Löschen des Verifizierungsvideos für Benutzer {}: {}", userId, e.getMessage());
                // Don't throw exception - the user is still approved, just log the error
            }
        }

        log.info("Benutzer {} wurde verifiziert. Geschlecht: {}", userId, gender);

        // Der "Magic Moment" (Push-Benachrichtigung) - später implementieren
        // pushNotificationService.sendVerificationApproved(user);
    }

    /**
     * Lehnt einen Benutzer aus einem bestimmten Grund ab.
     */
    @Transactional
    public void rejectVerification(UUID userId, VerificationStatus reason) {
        if (reason != VerificationStatus.rejected_bad_video && reason != VerificationStatus.rejected_mismatch) {
            throw new IllegalArgumentException("Ungültiger Ablehnungsgrund.");
        }

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("Benutzer nicht gefunden."));

        if (user.getVerificationStatus() != VerificationStatus.pending_review) {
            throw new IllegalStateException("Benutzer wartet nicht auf Genehmigung.");
        }

        // ✅ Store old video URL before clearing it
        String oldVideoUrl = user.getVerificationVideoUrl();

        user.setVerificationStatus(reason);
        user.setVerificationVideoUrl(null); // Delete reference

        userRepository.save(user);

        // ✅ NEW: Delete the actual file from storage
        if (oldVideoUrl != null) {
            try {
                storageService.deleteFile(oldVideoUrl);
                log.info("Verifizierungsvideo gelöscht für abgelehnten Benutzer: {}", userId);
            } catch (IOException e) {
                log.error("Fehler beim Löschen des Verifizierungsvideos für abgelehnten Benutzer {}: {}", userId, e.getMessage());
                // Don't throw exception - the rejection still proceeds
            }
        }

        log.info("Benutzer {} wurde abgelehnt. Grund: {}", userId, reason);

        // (Optional) Sende Push-Benachrichtigung über Ablehnung
        // pushNotificationService.sendVerificationRejected(user, reason);
    }
}