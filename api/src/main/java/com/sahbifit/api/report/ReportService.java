package com.sahbifit.api.report;

import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sahbifit.api.exception.ResourceNotFoundException;
import com.sahbifit.api.report.dto.CreateReportDto;
import com.sahbifit.api.report.model.Report;
import com.sahbifit.api.report.model.ReportPriority;
import com.sahbifit.api.report.model.ReportStatus;
import com.sahbifit.api.report.repository.ReportRepository;
import com.sahbifit.api.session.model.Session;
import com.sahbifit.api.session.repository.SessionRepository;
import com.sahbifit.api.user.model.User;
import com.sahbifit.api.user.model.UserRole;
import com.sahbifit.api.user.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReportService {

    private static final Logger log = LoggerFactory.getLogger(ReportService.class);

    private final ReportRepository reportRepository;
    private final UserRepository userRepository;
    private final SessionRepository sessionRepository; // Required for optional sessionId

    // Defines the critical keywords
    private static final Set<String> CRITICAL_KEYWORDS = Set.of(
            "safety", "threat", "harassment", "gefahr", "bedrohung", "unsafe", 
            "belästigung", "gewalt", "violence", "stalking"
    );

    @Transactional
    public void createReport(CreateReportDto dto, String reporterPhoneNumber) {
        // 1. Find reporter
        User reporterUser = userRepository.findByPhoneNumber(reporterPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", reporterPhoneNumber));

        // 2. Find reported user
        User reportedUser = userRepository.findById(dto.getReportedUserId())
                .orElseThrow(() -> new ResourceNotFoundException("User", "userId", dto.getReportedUserId()));

        // 3. Find optional session
        Session session = null;
        if (dto.getSessionId() != null) {
            // We don't fail if the session ID is invalid, we just log it.
            session = sessionRepository.findById(dto.getSessionId()).orElse(null);
            if (session == null) {
                log.warn("Report created with invalid sessionId: {}", dto.getSessionId());
            }
        }

        // 4. Determine priority (MVP 7.2)
        ReportPriority priority = determinePriority(dto.getReason(), reporterUser);

        // 5. Create report object
        Report report = new Report();
        report.setReportedBy(reporterUser);
        report.setReportedUser(reportedUser);
        report.setSession(session);
        report.setReason(dto.getReason());
        report.setPriority(priority);
        report.setStatus(ReportStatus.pending); // Default status

        // 6. Save report
        reportRepository.save(report);

        // 7. (Optional) Immediate notification for critical priority
        if (priority == ReportPriority.critical) {
            log.warn("[SLEEP-SAFE TRIAGE] Critical report (ID: {}) from {} against {}. Reason: {}",
                    report.getReportId(), reporterUser.getUserId(), reportedUser.getUserId(), dto.getReason());
            // Trigger event here, e.g., via ApplicationEventPublisher
            // (e.g., publishEvent(new CriticalReportEvent(this, report));)
        }
    }

    /**
     * Determines the priority of a report based on keywords and the reporter's role.
     * (MVP 7.2 logic)
     */
    private ReportPriority determinePriority(String reason, User reporter) {
        String lowerCaseReason = reason.toLowerCase();

        // 1. Check for critical keywords
        boolean isCritical = CRITICAL_KEYWORDS.stream().anyMatch(lowerCaseReason::contains);
        if (isCritical) {
            return ReportPriority.critical;
        }

        // 2. Check reporter's role
        if (reporter.getRole() == UserRole.ambassador || reporter.getRole() == UserRole.admin) {
            return ReportPriority.high;
        }

        // 3. Otherwise
        return ReportPriority.low;
    }
}