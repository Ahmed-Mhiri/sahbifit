// Pfad: src/main/java/com/sahbifit/api/external/chat/FirebaseChatService.java
package com.sahbifit.api.external.chat;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ExecutionException;

@Service
public class FirebaseChatService implements ChatService {

    private static final String COLLECTION_NAME = "session_chats";

    /**
     * (Method) Creates a chat document in Firestore for a new session.
     * (MVP 3.6)
     */
    @Override
    public String createChatForSession(UUID sessionId) {
        try {
            Firestore db = FirestoreClient.getFirestore();
            String documentId = sessionId.toString();

            // Create an initial message or empty document
            Map<String, Object> initialData = new HashMap<>();
            initialData.put("systemMessage", "Session chat created.");
            // We can add a "messages" subcollection or an empty array later

            // Asynchronously write the document
            ApiFuture<WriteResult> future = db.collection(COLLECTION_NAME)
                                              .document(documentId)
                                              .set(initialData);

            // Wait for the write to complete (in a real app, you might not block)
            future.get(); // Blocks until write is complete

            return documentId;
        } catch (InterruptedException | ExecutionException e) {
            // Handle exceptions appropriately
            throw new RuntimeException("Failed to create Firestore chat room", e);
        }
    }
}