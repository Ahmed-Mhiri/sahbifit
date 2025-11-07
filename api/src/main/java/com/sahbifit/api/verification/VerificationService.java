package com.sahbifit.api.verification;

import java.io.IOException;

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

        // 2. Generate unique filename
        String fileName = user.getUserId().toString() + "_" + System.currentTimeMillis() + ".mp4";
        String folder = "verification-videos";

        log.info("Starting video upload for user: {}, filename: {}", userPhoneNumber, fileName);

        // 3. Upload file
        String fileUrl = storageService.uploadFile(videoFile, folder, fileName);

        // 4. Set user status to "pending_review"
        user.setVerificationVideoUrl(fileUrl);
        user.setVerificationStatus(VerificationStatus.pending_review);

        // 5. Important: Reset gender if it was previously rejected
        user.setVerifiedGender(VerifiedGender.not_verified);

        userRepository.save(user);
        
        log.info("Video successfully uploaded for user: {}, URL: {}", userPhoneNumber, fileUrl);
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