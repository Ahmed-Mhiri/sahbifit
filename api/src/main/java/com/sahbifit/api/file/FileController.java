package com.sahbifit.api.file;

import com.sahbifit.api.external.storage.StorageService;
import com.sahbifit.api.file.dto.FileUploadResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Slf4j
@RestController
@RequestMapping("/api/files")
@RequiredArgsConstructor
public class FileController {

    private final StorageService storageService;
    
    // Define allowed content types and max size
    private static final List<String> ALLOWED_IMAGE_TYPES = List.of("image/jpeg", "image/png", "image/webp");
    private static final long MAX_FILE_SIZE = 5 * 1024 * 1024; // 5 MB

    /**
     * Endpoint for uploading a profile photo.
     * Must be authenticated.
     */
    @PostMapping("/upload-image")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<?> uploadImage(@RequestParam("file") MultipartFile file) {
        
        // 1. Validation
        if (file.isEmpty()) {
            return ResponseEntity.badRequest().body("{\"message\": \"File cannot be empty.\"}");
        }

        String contentType = file.getContentType();
        if (contentType == null || !ALLOWED_IMAGE_TYPES.contains(contentType)) {
            log.warn("Invalid file type uploaded: {}", contentType);
            return ResponseEntity.badRequest().body("{\"message\": \"Invalid file type. Only JPG, PNG, and WebP are allowed.\"}");
        }

        if (file.getSize() > MAX_FILE_SIZE) {
            log.warn("File size exceeded: {} bytes", file.getSize());
            return ResponseEntity.badRequest().body("{\"message\": \"File size must not exceed 5MB.\"}");
        }

        try {
            // 2. Generate unique filename (e.g., using UUID)
            String extension = ".jpg"; // Default or derive from content type
            if ("image/png".equals(contentType)) extension = ".png";
            if ("image/webp".equals(contentType)) extension = ".webp";
            
            String fileName = UUID.randomUUID().toString() + extension;
            String folder = "profile-photos";

            // 3. Upload file using existing service
            // This returns the KEY, not the full URL [cite: 280]
            String fileKey = storageService.uploadFile(file, folder, fileName);

            // 4. Generate the public URL from the key
            // We use the existing public method from StorageService [cite: 297, 287]
            String publicUrl = storageService.generatePublicUrl(fileKey);

            // 5. Return the URL in the specified JSON format
            return ResponseEntity.ok(new FileUploadResponse(publicUrl));

        } catch (IOException e) {
            log.error("Error uploading profile photo: {}", e.getMessage(), e);
            return ResponseEntity.internalServerError().body("{\"message\": \"Could not upload file: " + e.getMessage() + "\"}");
        }
    }
}