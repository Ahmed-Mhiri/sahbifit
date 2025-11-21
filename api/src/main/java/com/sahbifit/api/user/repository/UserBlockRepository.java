package com.sahbifit.api.user.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sahbifit.api.user.model.User; // <-- ADD IMPORT
import com.sahbifit.api.user.model.UserBlock;
import com.sahbifit.api.user.model.UserBlockId;

@Repository
public interface UserBlockRepository extends JpaRepository<UserBlock, UserBlockId> {

    boolean existsByBlockerUserIdAndBlockedUserId(UUID blockerUserId, UUID blockedUserId);

    // --- FIX STARTS HERE ---
    // Old: findAllByBlockerUserId(UUID blockerUserId); <- Spring struggles mapping this correctly
    // New: Search by the User entity directly.
    List<UserBlock> findAllByBlocker(User blocker);
    // --- FIX ENDS HERE ---

    void deleteByBlockerUserIdAndBlockedUserId(UUID blockerUserId, UUID blockedUserId);

    @Query("SELECT COUNT(b) > 0 FROM UserBlock b WHERE " +
           "(b.blocker.userId = :user1Id AND b.blocked.userId = :user2Id) OR " +
           "(b.blocker.userId = :user2Id AND b.blocked.userId = :user1Id)")
    boolean hasBlockRelationship(@Param("user1Id") UUID user1Id, @Param("user2Id") UUID user2Id);

    @Query("SELECT b.blocked.userId FROM UserBlock b WHERE b.blocker.userId = :userId " +
           "UNION " +
           "SELECT b.blocker.userId FROM UserBlock b WHERE b.blocked.userId = :userId")
    List<UUID> findAllForbiddenUserIds(@Param("userId") UUID userId);
}