package com.sahbifit.api.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Configuration
@ConfigurationProperties(prefix = "cloudflare.r2")
public class CloudflareConfig {
    private String accessKeyId;
    private String secretAccessKey;
    private String bucketName;
    private String accountId;
    private String publicUrl;
    private String endpoint;
    
    public String getEndpoint() {
        return String.format("https://%s.r2.cloudflarestorage.com", accountId);
    }
    
    public String getPublicUrl() {
        return String.format("https://pub-%s.r2.dev", accountId);
    }
}