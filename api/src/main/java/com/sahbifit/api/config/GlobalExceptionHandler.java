package com.sahbifit.api.config;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MultipartException;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {

    // ... (other existing handlers)

    /**
     * Handles file upload size limit exceptions and other multipart errors
     */
    @ExceptionHandler(MultipartException.class)
    public ResponseEntity<String> handleMultipartException(MultipartException ex) {
        log.warn("Multipart request error: {}", ex.getMessage());
        
        // Check if it's a file size limit exceeded error
        if (ex.getMessage() != null && 
            (ex.getMessage().contains("SizeLimitExceededException") || 
             ex.getMessage().contains("FileSizeLimitExceededException"))) {
            return ResponseEntity.badRequest().body("File upload error: The video file must not exceed 100MB.");
        }
        
        return ResponseEntity.badRequest().body("File upload error: " + ex.getMessage());
    }
}