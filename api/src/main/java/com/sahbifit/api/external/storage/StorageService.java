package com.sahbifit.api.external.storage;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface StorageService {
    /**
     * Uploads a file to cloud storage.
     * @param file The file to upload.
     * @param folder The target folder in the bucket (e.g., "verification-videos").
     * @param fileName The desired filename (should be unique).
     * @return The object key of the uploaded file.
     */
    String uploadFile(MultipartFile file, String folder, String fileName) throws IOException;
    
    /**
     * Deletes a file from cloud storage.
     * @param fileKey The object key of the file to delete.
     */
    void deleteFile(String fileKey) throws IOException;
    
    /**
     * Generates a public URL for the given object key.
     * @param key The object key stored in the database.
     * @return The public URL that can be used to access the file.
     */
    String generatePublicUrl(String key);
}