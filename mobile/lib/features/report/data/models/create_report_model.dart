import 'package:equatable/equatable.dart';

/// Data Transfer Object (DTO) for creating a report.
/// This model is a direct Dart representation of the backend's `CreateReportDto`.
class CreateReportModel extends Equatable {
  final String reportedUserId;
  final String reason;
  final String? sessionId;

  const CreateReportModel({
    required this.reportedUserId,
    required this.reason,
    this.sessionId,
  });

  /// Converts the Dart model into a JSON map to be sent to the API.
  Map<String, dynamic> toJson() {
    return {
      'reportedUserId': reportedUserId,
      'reason': reason,
      'sessionId': sessionId,
    };
  }

  @override
  List<Object?> get props => [reportedUserId, reason, sessionId];
}