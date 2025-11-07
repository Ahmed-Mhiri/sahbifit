package com.sahbifit.api.config;

import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.S3Configuration;

@Configuration
public class S3ClientConfig {

    @Autowired
    private CloudflareConfig cloudflareConfig;

    @Bean
    public S3Client s3Client() {
        AwsBasicCredentials awsCreds = AwsBasicCredentials.create(
            cloudflareConfig.getAccessKeyId(),
            cloudflareConfig.getSecretAccessKey()
        );

        return S3Client.builder()
                .credentialsProvider(StaticCredentialsProvider.create(awsCreds))
                .endpointOverride(URI.create(cloudflareConfig.getEndpoint()))
                .region(Region.of("auto")) 
                .serviceConfiguration(S3Configuration.builder()
                        .chunkedEncodingEnabled(false) 
                        .pathStyleAccessEnabled(true) 
                        .build())
                .build();
    }
}