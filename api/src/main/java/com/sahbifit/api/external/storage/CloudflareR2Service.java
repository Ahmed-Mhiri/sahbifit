package com.sahbifit.api.external.storage;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.S3Exception;

import java.io.IOException;
import java.util.UUID;

import com.sahbifit.api.config.CloudflareConfig;

@Slf4j
@Service
public class CloudflareR2Service implements StorageService {

    @Autowired
    private S3Client s3Client;
    
    @Autowired
    private CloudflareConfig cloudflareConfig;

    @Override
    public String uploadFile(MultipartFile file, String folder, String fileName) throws IOException {
        try {
            // File validation
            if (file.isEmpty()) {
                throw new IllegalArgumentException("File is empty");
            }

            // Generate the complete S3 key (path in the bucket)
            String key = generateFileKey(folder, fileName);
            
            log.info("Uploading file: {} -> {}/{}", file.getOriginalFilename(), 
                    cloudflareConfig.getBucketName(), key);

            // Metadata for the video
            var metadata = new java.util.HashMap<String, String>();
            metadata.put("Content-Type", file.getContentType());
            metadata.put("Original-Filename", file.getOriginalFilename());
            metadata.put("Upload-Timestamp", String.valueOf(System.currentTimeMillis()));

            // Create PutObjectRequest
            PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                    .bucket(cloudflareConfig.getBucketName())
                    .key(key)
                    .contentType(file.getContentType())
                    .contentLength(file.getSize())
                    .metadata(metadata)
                    .build();

            // Upload file
            s3Client.putObject(putObjectRequest, 
                    RequestBody.fromBytes(file.getBytes()));
            
            log.info("File successfully uploaded: {}/{}", cloudflareConfig.getBucketName(), key);
            return key; // RETURN THE KEY INSTEAD OF PUBLIC URL

        } catch (S3Exception e) {
            log.error("S3 error uploading file: {}", e.awsErrorDetails().errorMessage(), e);
            throw new IOException("Error uploading file: " + e.awsErrorDetails().errorMessage(), e);
        } catch (Exception e) {
            log.error("Unexpected error uploading file", e);
            throw new IOException("Unexpected error during upload: " + e.getMessage(), e);
        }
    }

    @Override
    public void deleteFile(String fileKey) throws IOException {
        try {
            log.info("Deleting file: {}", fileKey);
            
            DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
                    .bucket(cloudflareConfig.getBucketName())
                    .key(fileKey) // USE THE KEY DIRECTLY
                    .build();

            s3Client.deleteObject(deleteObjectRequest);
            
            log.info("File successfully deleted: {}", fileKey);

        } catch (S3Exception e) {
            log.error("S3 error deleting file: {}", e.awsErrorDetails().errorMessage(), e);
            throw new IOException("Error deleting file: " + e.awsErrorDetails().errorMessage(), e);
        }
    }

    /**
     * Generates the public URL for the file
     * Now public so AdminService can use it
     */
    @Override
    public String generatePublicUrl(String key) {
        if (key == null) return null;
        return String.format("%s/%s", cloudflareConfig.getPublicUrl(), key);
    }

    /**
     * Generates the S3 key for the file
     */
    private String generateFileKey(String folder, String fileName) {
        // Remove leading and trailing slashes
        String cleanFolder = folder.replaceAll("^/|/$", "");
        return String.format("%s/%s", cleanFolder, fileName);
    }

    /**
     * Helper method to generate a unique filename
     */
    public String generateUniqueFileName(String originalFileName) {
        String extension = "";
        if (originalFileName != null && originalFileName.contains(".")) {
            extension = originalFileName.substring(originalFileName.lastIndexOf("."));
        }
        return UUID.randomUUID().toString() + extension;
    }
}