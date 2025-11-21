package com.sahbifit.api.report;

import com.sahbifit.api.report.dto.ReportDto;
import com.sahbifit.api.report.model.Report;
import com.sahbifit.api.user.UserMapper;

import java.util.List;
import java.util.stream.Collectors;

public class ReportMapper {

    public static ReportDto toDto(Report report) {
        if (report == null) {
            return null;
        }

        return new ReportDto(
            report.getReportId(),
            UserMapper.toSummaryDto(report.getReportedBy()),
            UserMapper.toSummaryDto(report.getReportedUser()),
            report.getSession() != null ? report.getSession().getSessionId() : null,
            report.getReason(),
            report.getPriority(),
            report.getStatus(),
            report.getCreatedAt()
        );
    }

    public static List<ReportDto> toDtoList(List<Report> reports) {
        return reports.stream()
            .map(ReportMapper::toDto)
            .collect(Collectors.toList());
    }
}