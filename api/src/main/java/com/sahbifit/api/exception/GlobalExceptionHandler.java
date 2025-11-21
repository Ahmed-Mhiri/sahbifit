package com.sahbifit.api.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MultipartException;

import java.util.Map;

@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {

    /**
     * Handles authentication failures (wrong phone/password).
     * Returns 401 Unauthorized.
     */
    @ExceptionHandler({BadCredentialsException.class, UsernameNotFoundException.class})
    public ResponseEntity<Map<String, String>> handleAuthErrors(Exception ex) {
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
            .body(Map.of("message", "Invalid phone number or password."));
    }

    /**
     * Handles disabled accounts (e.g., SMS not verified).
     * Returns 403 Forbidden.
     */
    @ExceptionHandler(DisabledException.class)
    public ResponseEntity<Map<String, String>> handleDisabledUser(Exception ex) {
        return ResponseEntity.status(HttpStatus.FORBIDDEN)
            .body(Map.of("message", "Account not verified. Please verify your phone number."));
    }

    /**
     * Handles file upload size limit exceptions and other multipart errors.
     * Returns 400 Bad Request.
     */
    @ExceptionHandler(MultipartException.class)
    public ResponseEntity<Map<String, String>> handleMultipartException(MultipartException ex) {
        log.warn("Multipart request error: {}", ex.getMessage());
        
        String message = "File upload error: " + ex.getMessage();

        // Check if it's a file size limit exceeded error
        if (ex.getMessage() != null && 
            (ex.getMessage().contains("SizeLimitExceededException") || 
             ex.getMessage().contains("FileSizeLimitExceededException"))) {
            message = "File upload error: The video file must not exceed 100MB.";
        }
        
        return ResponseEntity.badRequest().body(Map.of("message", message));
    }

    /**
     * Fallback for other unexpected runtime exceptions.
     * Returns 500 Internal Server Error.
     */
    @ExceptionHandler(Exception.class)
    public ResponseEntity<Map<String, String>> handleGeneralException(Exception ex) {
        log.error("Unexpected error: ", ex); // Log the full stack trace
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
            .body(Map.of(
                "message", "An unexpected error occurred.",
                "details", ex.getMessage() != null ? ex.getMessage() : "Unknown error"
            ));
    }
}