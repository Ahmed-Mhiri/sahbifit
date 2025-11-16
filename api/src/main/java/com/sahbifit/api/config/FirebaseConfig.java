package com.sahbifit.api.config;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.FirebaseMessaging;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import java.io.IOException;

@Configuration
public class FirebaseConfig {

    /**
     * Initializes the Firebase Admin SDK.
     * It automatically finds the credentials from the
     * GOOGLE_APPLICATION_CREDENTIALS environment variable.
     * This is the secure, production-ready method.
     */
    @Bean
    public FirebaseApp firebaseApp() throws IOException {
        
        // This automatically reads the GOOGLE_APPLICATION_CREDENTIALS environment variable.
        // The insecure fallback to read "serviceAccountKey.json" from resources has been removed.
        GoogleCredentials credentials = GoogleCredentials.getApplicationDefault();

        FirebaseOptions options = FirebaseOptions.builder()
            .setCredentials(credentials)
            // You might need to add your project ID or other details if not auto-detected
            // .setProjectId("your-project-id") 
            .build();

        // Check if FirebaseApp has already been initialized.
        // This prevents errors during app reloads (e.g., in a dev environment).
        if (FirebaseApp.getApps().isEmpty()) {
            return FirebaseApp.initializeApp(options);
        } else {
            return FirebaseApp.getInstance();
        }
    }

    /**
     * Provides the FirebaseMessaging bean to other services.
     */
    @Bean
    public FirebaseMessaging firebaseMessaging(FirebaseApp firebaseApp) {
        return FirebaseMessaging.getInstance(firebaseApp);
    }
}