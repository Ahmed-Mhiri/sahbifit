package com.sahbifit.api.report.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sahbifit.api.report.model.Report;
import com.sahbifit.api.report.model.ReportStatus;

@Repository
public interface ReportRepository extends JpaRepository<Report, UUID> {
    List<Report> findByStatusOrderByPriorityDesc(ReportStatus status);
}