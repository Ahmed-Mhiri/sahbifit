// Pfad: src/main/java/com/sahbifit/api/external/chat/ChatService.java
package com.sahbifit.api.external.chat;

import java.util.UUID;

public interface ChatService {
    
    /**
     * Creates a new chat document in Firestore for a given session.
     * (MVP 3.6)
     * @param sessionId The UUID of the session.
     * @return The document ID (which is the sessionId as a string).
     */
    String createChatForSession(UUID sessionId);
}