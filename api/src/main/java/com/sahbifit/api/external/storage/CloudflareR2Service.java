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
            // Validierung der Datei
            if (file.isEmpty()) {
                throw new IllegalArgumentException("Datei ist leer");
            }

            // Generiere den vollständigen S3 Key (Pfad im Bucket)
            String key = generateFileKey(folder, fileName);
            
            log.info("Lade Datei hoch: {} -> {}/{}", file.getOriginalFilename(), 
                    cloudflareConfig.getBucketName(), key);

            // Metadaten für das Video
            var metadata = new java.util.HashMap<String, String>();
            metadata.put("Content-Type", file.getContentType());
            metadata.put("Original-Filename", file.getOriginalFilename());
            metadata.put("Upload-Timestamp", String.valueOf(System.currentTimeMillis()));

            // Erstelle PutObjectRequest
            PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                    .bucket(cloudflareConfig.getBucketName())
                    .key(key)
                    .contentType(file.getContentType())
                    .contentLength(file.getSize())
                    .metadata(metadata)
                    .build();

            // Datei hochladen
            s3Client.putObject(putObjectRequest, 
                    RequestBody.fromBytes(file.getBytes()));

            // Generiere die öffentliche URL
            String publicUrl = generatePublicUrl(key);
            
            log.info("Datei erfolgreich hochgeladen: {}", publicUrl);
            return publicUrl;

        } catch (S3Exception e) {
            log.error("S3 Fehler beim Hochladen der Datei: {}", e.awsErrorDetails().errorMessage(), e);
            throw new IOException("Fehler beim Hochladen der Datei: " + e.awsErrorDetails().errorMessage(), e);
        } catch (Exception e) {
            log.error("Unerwarteter Fehler beim Hochladen der Datei", e);
            throw new IOException("Unerwarteter Fehler beim Hochladen: " + e.getMessage(), e);
        }
    }

    @Override
    public void deleteFile(String fileUrl) throws IOException {
        try {
            // Extrahiere den Key aus der URL
            String key = extractKeyFromUrl(fileUrl);
            
            log.info("Lösche Datei: {}", key);
            
            DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
                    .bucket(cloudflareConfig.getBucketName())
                    .key(key)
                    .build();

            s3Client.deleteObject(deleteObjectRequest);
            
            log.info("Datei erfolgreich gelöscht: {}", key);

        } catch (S3Exception e) {
            log.error("S3 Fehler beim Löschen der Datei: {}", e.awsErrorDetails().errorMessage(), e);
            throw new IOException("Fehler beim Löschen der Datei: " + e.awsErrorDetails().errorMessage(), e);
        }
    }

    /**
     * Generiert den S3 Key für die Datei
     */
    private String generateFileKey(String folder, String fileName) {
        // Entferne führende und nachfolgende Schrägstriche
        String cleanFolder = folder.replaceAll("^/|/$", "");
        return String.format("%s/%s", cleanFolder, fileName);
    }

    /**
     * Generiert die öffentliche URL für die Datei
     */
    private String generatePublicUrl(String key) {
        return String.format("%s/%s", cloudflareConfig.getPublicUrl(), key);
    }

    /**
     * Extrahiert den S3 Key aus der öffentlichen URL
     */
    private String extractKeyFromUrl(String fileUrl) {
        String baseUrl = cloudflareConfig.getPublicUrl() + "/";
        if (fileUrl.startsWith(baseUrl)) {
            return fileUrl.substring(baseUrl.length());
        }
        throw new IllegalArgumentException("Ungültige R2 URL: " + fileUrl);
    }
    
    /**
     * Hilfsmethode zum Generieren eines eindeutigen Dateinamens
     */
    public String generateUniqueFileName(String originalFileName) {
        String extension = "";
        if (originalFileName != null && originalFileName.contains(".")) {
            extension = originalFileName.substring(originalFileName.lastIndexOf("."));
        }
        return UUID.randomUUID().toString() + extension;
    }
}