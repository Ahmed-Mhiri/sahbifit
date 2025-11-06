// Pfad: src/main/java/com/sahbifit/api/user/model/UserBlockId.java
package com.sahbifit.api.user.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;

import java.io.Serializable;
import java.util.UUID;

@Data
@Embeddable
public class UserBlockId implements Serializable {
    
    @Column(name = "blocker_user_id")
    private UUID blockerUserId;

    @Column(name = "blocked_user_id")
    private UUID blockedUserId;
}