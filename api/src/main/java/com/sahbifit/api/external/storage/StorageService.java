package com.sahbifit.api.external.storage;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface StorageService {
    /**
     * Lädt eine Datei in den Cloud-Speicher hoch.
     * @param file Die hochzuladende Datei.
     * @param folder Der Zielordner im Bucket (z.B. "verification-videos").
     * @param fileName Der gewünschte Dateiname (sollte eindeutig sein).
     * @return Die öffentliche URL der hochgeladenen Datei.
     */
    String uploadFile(MultipartFile file, String folder, String fileName) throws IOException;
    
    /**
     * Löscht eine Datei aus dem Cloud-Speicher.
     * @param fileUrl Die URL der zu löschenden Datei.
     */
    void deleteFile(String fileUrl) throws IOException;
}