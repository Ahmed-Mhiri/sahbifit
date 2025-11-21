package com.sahbifit.api.session;

import com.sahbifit.api.session.dto.CreateSessionDto;
import com.sahbifit.api.session.dto.MarkAttendanceDto;
import com.sahbifit.api.session.dto.SessionFeedDto;
import com.sahbifit.api.session.dto.SessionParticipantDto;
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

    @GetMapping
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<List<SessionFeedDto>> getActiveSessions(
            Principal principal,
            @RequestParam(required = false) VerifiedGender genderFilter) {
        
        List<SessionFeedDto> sessions = sessionService.getActiveSessions(principal.getName(), genderFilter);
        return ResponseEntity.ok(sessions);
    }

    @GetMapping("/{sessionId}")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<SessionFeedDto> getSessionById(
            @PathVariable UUID sessionId, 
            Principal principal) {
        
        SessionFeedDto session = sessionService.getSessionById(sessionId, principal.getName());
        return ResponseEntity.ok(session);
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<SessionFeedDto> createSession(@RequestBody CreateSessionDto dto, Principal principal) {
        SessionFeedDto newSession = sessionService.createSession(dto, principal.getName());
        return new ResponseEntity<>(newSession, HttpStatus.CREATED);
    }

    @PostMapping("/{sessionId}/join")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<Void> joinSession(@PathVariable UUID sessionId, Principal principal) {
        sessionService.joinSession(sessionId, principal.getName());
        return ResponseEntity.ok().build();
    }

    // --- NEW ENDPOINT FOR LEAVING/CANCELLING ---
    @PostMapping("/{sessionId}/leave")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<Void> leaveSession(@PathVariable UUID sessionId, Principal principal) {
        sessionService.leaveSession(sessionId, principal.getName());
        return ResponseEntity.ok().build();
    }
    // ------------------------------------------

    @PutMapping("/attendance")
    public ResponseEntity<Void> markAttendance(
            @Valid @RequestBody MarkAttendanceDto markAttendanceDto,
            Principal principal) {
        
        sessionService.markAttendance(markAttendanceDto, principal.getName());
        return ResponseEntity.ok().build();
    }

    @GetMapping("/{sessionId}/participants")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR', 'ADMIN')")
    public ResponseEntity<List<SessionParticipantDto>> getSessionParticipants(@PathVariable UUID sessionId) {
        return ResponseEntity.ok(sessionService.getSessionParticipants(sessionId));
    }

    @GetMapping("/my")
    @PreAuthorize("hasAnyRole('MEMBER', 'AMBASSADOR')")
    public ResponseEntity<List<SessionFeedDto>> getMySessions(Principal principal) {
        List<SessionFeedDto> sessions = sessionService.getMySessions(principal.getName());
        return ResponseEntity.ok(sessions);
    }
}