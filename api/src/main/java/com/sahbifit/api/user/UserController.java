package com.sahbifit.api.user;

import java.security.Principal;
import java.util.List; // <-- Added import
import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize; // <-- Added import for @PreAuthorize
import org.springframework.web.bind.annotation.DeleteMapping; // <-- Added import
import org.springframework.web.bind.annotation.GetMapping; // <-- Added import
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sahbifit.api.user.dto.PublicUserProfileDto; // <-- Added import
import com.sahbifit.api.user.dto.UpdateFcmTokenDto;
import com.sahbifit.api.user.dto.UpdateVisibilityDto;
import com.sahbifit.api.user.dto.UserProfileDto;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    // ... (Other user endpoints could be here, e.g., GET /api/users/me)

    /**
     * Endpoint to block another user.
     * The blocking user is identified via JWT (Principal).
     */
    @PostMapping("/{userId}/block")
    public ResponseEntity<Void> blockUser(
            @PathVariable UUID userId,
            Principal principal) {
        
        // principal.getName() contains the phone number of the authenticated user
        userService.blockUser(principal.getName(), userId);
        
        return ResponseEntity.ok().build();
    }

    /**
     * Updates the FCM push notification token for the currently authenticated user.
     */
    @PutMapping("/me/fcm-token")
    public ResponseEntity<Void> updateFcmToken(
            @Valid @RequestBody UpdateFcmTokenDto dto,
            Principal principal) {
        
        userService.updateFcmToken(principal.getName(), dto);
        return ResponseEntity.ok().build();
    }

    /**
     * Updates the profile visibility setting for the currently authenticated user.
     */
    @PutMapping("/me/visibility")
    public ResponseEntity<Void> updateProfileVisibility(
            @Valid @RequestBody UpdateVisibilityDto dto,
            Principal principal) {
        
        userService.updateProfileVisibility(principal.getName(), dto);
        return ResponseEntity.ok().build();
    }

    // --- ADDED ENDPOINTS ---

    /**
     * Gets the list of users the authenticated user has blocked.
     */
    @GetMapping("/me/blocked")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<List<PublicUserProfileDto>> getMyBlockedUsers(Principal principal) {
        List<PublicUserProfileDto> blockedUsers = userService.getBlockedUsers(principal.getName());
        return ResponseEntity.ok(blockedUsers);
    }

    /**
     * Unblocks a user.
     * We use the DELETE verb on the resource that is being deleted (the block record).
     */
    @DeleteMapping("/me/blocked/{userId}")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<Void> unblockUser(
            @PathVariable UUID userId,
            Principal principal) {
        
        userService.unblockUser(principal.getName(), userId);
        return ResponseEntity.noContent().build(); // 204 No Content is standard for success
    }

    @GetMapping("/me")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR', 'ADMIN')")
    public ResponseEntity<UserProfileDto> getCurrentUser(Principal principal) {
        // principal.getName() is the phone number extracted from the JWT
        UserProfileDto userProfile = userService.getMyProfile(principal.getName());
        return ResponseEntity.ok(userProfile);
    }

    
    @GetMapping("/{userId}")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR', 'ADMIN')")
    public ResponseEntity<UserProfileDto> getUserProfile(
            @PathVariable UUID userId,
            Principal principal) { // <-- Add Principal
        
        // Pass the requester's phone number to perform the block check
        UserProfileDto userProfile = userService.getUserProfile(userId, principal.getName());
        return ResponseEntity.ok(userProfile);
    }
}