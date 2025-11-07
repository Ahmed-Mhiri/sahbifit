package com.sahbifit.api.external.storage;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface StorageService {
    /**
     * Uploads a file to cloud storage.
     * @param file The file to upload.
     * @param folder The target folder in the bucket (e.g., "verification-videos").
     * @param fileName The desired filename (should be unique).
     * @return The public URL of the uploaded file.
     */
    String uploadFile(MultipartFile file, String folder, String fileName) throws IOException;
    
    /**
     * Deletes a file from cloud storage.
     * @param fileUrl The URL of the file to delete.
     */
    void deleteFile(String fileUrl) throws IOException;
}