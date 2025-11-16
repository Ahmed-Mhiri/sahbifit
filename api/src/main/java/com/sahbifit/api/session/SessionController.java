// Pfad: src/main/java/com/sahbifit/api/session/SessionController.java
package com.sahbifit.api.session;

import com.sahbifit.api.session.dto.CreateSessionDto;
import com.sahbifit.api.session.dto.MarkAttendanceDto;
import com.sahbifit.api.session.model.Session;
import com.sahbifit.api.verification.model.VerifiedGender;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/sessions")
@RequiredArgsConstructor
public class SessionController {

    private final SessionService sessionService;

    /**
     * (Mobile App) Get the active session feed.
     * Can be filtered by gender (e.g., /api/sessions?genderFilter=female)
     */
    @GetMapping
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<List<Session>> getActiveSessions(
            Principal principal,
            @RequestParam(required = false) VerifiedGender genderFilter) {
        
        List<Session> sessions = sessionService.getActiveSessions(principal.getName(), genderFilter);
        return ResponseEntity.ok(sessions);
    }

    /**
     * (NEW ENDPOINT) (Mobile App) Get a single session by its ID.
     */
    @GetMapping("/{sessionId}")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<Session> getSessionById(
            @PathVariable UUID sessionId, 
            Principal principal) {
        
        Session session = sessionService.getSessionById(sessionId, principal.getName());
        return ResponseEntity.ok(session);
    }

    /**
     * (Mobile App) Create a new session.
     */
    @PostMapping
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<Session> createSession(@RequestBody CreateSessionDto dto, Principal principal) {
        Session newSession = sessionService.createSession(dto, principal.getName());
        return new ResponseEntity<>(newSession, HttpStatus.CREATED);
    }

    /**
     * (Mobile App) Join a session.
     */
    @PostMapping("/{sessionId}/join")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<Void> joinSession(@PathVariable UUID sessionId, Principal principal) {
        sessionService.joinSession(sessionId, principal.getName());
        return ResponseEntity.ok().build();
    }

    @PutMapping("/attendance")
    public ResponseEntity<Void> markAttendance(
            @Valid @RequestBody MarkAttendanceDto markAttendanceDto,
            Principal principal) {
        
        sessionService.markAttendance(markAttendanceDto, principal.getName());
        return ResponseEntity.ok().build();
    }
}