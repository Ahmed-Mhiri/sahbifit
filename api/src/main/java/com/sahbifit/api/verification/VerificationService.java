package com.sahbifit.api.verification;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.sahbifit.api.external.storage.StorageService;
import com.sahbifit.api.model.enums.VerificationStatus;
import com.sahbifit.api.model.enums.VerifiedGender;
import com.sahbifit.api.user.model.User;
import com.sahbifit.api.user.repository.UserRepository;
import com.sahbifit.api.verification.dto.VerificationStatusDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class VerificationService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private StorageService storageService; // CloudflareR2Service wird injiziert

    /**
     * Verarbeitet das hochgeladene Verifizierungsvideo eines Benutzers.
     */
    @Transactional
    public void submitVerificationVideo(String userPhoneNumber, MultipartFile videoFile) throws IOException {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new RuntimeException("Benutzer nicht gefunden."));

        // 1. Validierung: Verhindert doppelte Uploads
        if (user.getVerificationStatus() == VerificationStatus.pending_review || 
            user.getVerificationStatus() == VerificationStatus.verified) {
            throw new IllegalStateException("Überprüfung bereits abgeschlossen oder ausstehend.");
        }

        // 2. Eindeutigen Dateinamen generieren
        String fileName = user.getUserId().toString() + "_" + System.currentTimeMillis() + ".mp4";
        String folder = "verification-videos";

        log.info("Starte Video-Upload für Benutzer: {}, Dateiname: {}", userPhoneNumber, fileName);

        // 3. Datei hochladen
        String fileUrl = storageService.uploadFile(videoFile, folder, fileName);

        // 4. Benutzerstatus auf "pending_review" setzen
        user.setVerificationVideoUrl(fileUrl);
        user.setVerificationStatus(VerificationStatus.pending_review);

        // 5. Wichtig: Geschlecht zurücksetzen, falls es zuvor abgelehnt wurde
        user.setVerifiedGender(VerifiedGender.not_verified);

        userRepository.save(user);
        
        log.info("Video erfolgreich hochgeladen für Benutzer: {}, URL: {}", userPhoneNumber, fileUrl);
    }

    /**
     * Ruft den aktuellen Verifizierungsstatus des Benutzers ab.
     */
    public VerificationStatusDto getVerificationStatus(String userPhoneNumber) {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new RuntimeException("Benutzer nicht gefunden."));

        return new VerificationStatusDto(user.getVerificationStatus(), user.getVerifiedGender());
    }
}