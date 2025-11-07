package com.sahbifit.api.user.repository;

import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sahbifit.api.user.model.UserBlock;
import com.sahbifit.api.user.model.UserBlockId;

@Repository
public interface UserBlockRepository extends JpaRepository<UserBlock, UserBlockId> {

    // Hilfsmethode, um zu prüfen, ob eine Blockierung bereits existiert
    boolean existsByBlockerUserIdAndBlockedUserId(UUID blockerUserId, UUID blockedUserId);
}