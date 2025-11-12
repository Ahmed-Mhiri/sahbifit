abstract class ReportRepository {
  Future<void> createReport({
    required String reportedUserId,
    required String reason,
    String? sessionId,
  });
}