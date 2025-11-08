package com.sahbifit.api.verification;

import java.io.IOException;
import java.time.OffsetDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.sahbifit.api.external.storage.StorageService;
import com.sahbifit.api.user.model.User;
import com.sahbifit.api.user.repository.UserRepository;
import com.sahbifit.api.verification.dto.VerificationStatusDto;
import com.sahbifit.api.verification.model.VerificationStatus;
import com.sahbifit.api.verification.model.VerifiedGender;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class VerificationService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private StorageService storageService; // CloudflareR2Service is injected

    /**
     * Processes the uploaded verification video of a user.
     */
    @Transactional
    public void submitVerificationVideo(String userPhoneNumber, MultipartFile videoFile) throws IOException {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new RuntimeException("User not found."));

        // 1. Validation: Prevents duplicate uploads
        if (user.getVerificationStatus() == VerificationStatus.pending_review || 
            user.getVerificationStatus() == VerificationStatus.verified) {
            throw new IllegalStateException("Verification already completed or pending.");
        }

        // 1b. Get the key for the old video, if it exists
        String oldVideoKey = user.getVerificationVideoUrl();

        // 2. Generate unique filename
        String fileName = user.getUserId().toString() + "_" + System.currentTimeMillis() + ".mp4";
        String folder = "verification-videos";

        log.info("Starting video upload for user: {}, filename: {}", userPhoneNumber, fileName);

        // 3. Upload file - now returns the key instead of public URL
        String fileKey = storageService.uploadFile(videoFile, folder, fileName);

        // 4. Set user status to "pending_review" - store the key directly
        user.setVerificationVideoUrl(fileKey);
        user.setVerificationStatus(VerificationStatus.pending_review);

        // 5. Important: Reset gender if it was previously rejected
        user.setVerifiedGender(VerifiedGender.not_verified);

        // 6. Set the submission timestamp
        user.setVerificationSubmittedAt(OffsetDateTime.now());

        userRepository.save(user);

        log.info("Video successfully uploaded for user: {}, Key: {}", userPhoneNumber, fileKey);

        // 7. Delete the old file after the transaction is successful
        if (oldVideoKey != null && !oldVideoKey.equals(fileKey)) {
            try {
                storageService.deleteFile(oldVideoKey);
                log.info("Successfully deleted old verification video: {}", oldVideoKey);
            } catch (IOException e) {
                // Log this as a warning. The upload was still successful,
                // but we have an orphaned file in storage.
                log.warn("Failed to delete old video {}. New video {} was saved. This file is an orphan.", oldVideoKey, fileKey, e);
            }
        }
    }

    /**
     * Retrieves the current verification status of the user.
     */
    public VerificationStatusDto getVerificationStatus(String userPhoneNumber) {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new RuntimeException("User not found."));

        return new VerificationStatusDto(user.getVerificationStatus(), user.getVerifiedGender());
    }
}