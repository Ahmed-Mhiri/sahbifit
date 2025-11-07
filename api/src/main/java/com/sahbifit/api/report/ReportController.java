package com.sahbifit.api.report;

import java.security.Principal;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sahbifit.api.report.dto.CreateReportDto;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/reports")
@RequiredArgsConstructor
public class ReportController {

    private final ReportService reportService;

    @PostMapping
    public ResponseEntity<Void> createReport(
            @Valid @RequestBody CreateReportDto createReportDto,
            Principal principal) {
        
        reportService.createReport(createReportDto, principal.getName());
        
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }
}