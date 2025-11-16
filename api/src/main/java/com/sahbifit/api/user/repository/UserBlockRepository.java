package com.sahbifit.api.user.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sahbifit.api.user.model.UserBlock;
import com.sahbifit.api.user.model.UserBlockId;

@Repository
public interface UserBlockRepository extends JpaRepository<UserBlock, UserBlockId> {

    // Hilfsmethode, um zu prüfen, ob eine Blockierung bereits existiert
    boolean existsByBlockerUserIdAndBlockedUserId(UUID blockerUserId, UUID blockedUserId);

    /**
     * Finds all blocks initiated by a specific user.
     */
    List<UserBlock> findAllByBlockerUserId(UUID blockerUserId);

    // --- ADD THIS METHOD (for DELETE /me/blocked/{userId}) ---
    /**
     * Deletes a block record by its composite key parts.
     */
    void deleteByBlockerUserIdAndBlockedUserId(UUID blockerUserId, UUID blockedUserId);
}