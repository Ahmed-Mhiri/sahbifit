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
     * Endpunkt zum Einreichen des Verifizierungsvideos.
     */
    @PostMapping("/submit")
    public ResponseEntity<?> submitVideo(
            @AuthenticationPrincipal UserDetails userDetails,
            @RequestParam("video") MultipartFile videoFile) {

        String userPhoneNumber = userDetails.getUsername();
        log.info("Video-Upload-Anfrage von Benutzer: {}", userPhoneNumber);

        try {
            // 1. Validierung: Datei ist nicht leer
            if (videoFile.isEmpty()) {
                log.warn("Leere Datei von Benutzer: {}", userPhoneNumber);
                return ResponseEntity.badRequest().body("Die Videodatei ist leer.");
            }

            // ✅ IMPROVED: Allow multiple video types for better UX
            String contentType = videoFile.getContentType();
            if (contentType == null || !contentType.startsWith("video/")) {
                log.warn("Ungültiger Dateityp von Benutzer: {}, Typ: {}", userPhoneNumber, contentType);
                return ResponseEntity.badRequest().body("Nur Videodateien sind erlaubt.");
            }

            // ✅ OPTIONAL: More specific validation if needed
            List<String> allowedTypes = Arrays.asList("video/mp4", "video/quicktime", "video/webm", "video/x-msvideo");
            if (!allowedTypes.contains(contentType)) {
                log.warn("Nicht unterstützter Videotyp von Benutzer: {}, Typ: {}", userPhoneNumber, contentType);
                return ResponseEntity.badRequest().body("Nur MP4, MOV, WebM und AVI Videodateien sind erlaubt.");
            }

            // 3. Validierung: Dateigröße (max. 100MB)
            if (videoFile.getSize() > 100 * 1024 * 1024) {
                log.warn("Datei zu groß von Benutzer: {}, Größe: {} bytes", userPhoneNumber, videoFile.getSize());
                return ResponseEntity.badRequest().body("Die Videodatei darf maximal 100MB groß sein.");
            }

            // 4. Verarbeitung
            verificationService.submitVerificationVideo(userPhoneNumber, videoFile);
            
            log.info("Video erfolgreich verarbeitet für Benutzer: {}", userPhoneNumber);
            return ResponseEntity.ok("Video erfolgreich eingereicht. Die Überprüfung steht aus.");

        } catch (IllegalStateException e) {
            log.warn("Ungültiger Status für Video-Upload von Benutzer: {}, Fehler: {}", userPhoneNumber, e.getMessage());
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            log.error("Fehler beim Video-Upload für Benutzer: {}", userPhoneNumber, e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Fehler beim Upload: " + e.getMessage());
        }
    }

    /**
     * Endpunkt für die App, um den Status des Benutzers abzufragen
     * (z.B. um den "Probationary Mode" UI anzuzeigen).
     */
    @GetMapping("/status")
    public ResponseEntity<VerificationStatusDto> getStatus(@AuthenticationPrincipal UserDetails userDetails) {
        String userPhoneNumber = userDetails.getUsername();
        
        try {
            VerificationStatusDto statusDto = verificationService.getVerificationStatus(userPhoneNumber);
            log.debug("Statusabfrage für Benutzer: {}, Status: {}", userPhoneNumber, statusDto.getStatus());
            return ResponseEntity.ok(statusDto);
        } catch (Exception e) {
            log.error("Fehler bei Statusabfrage für Benutzer: {}", userPhoneNumber, e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}