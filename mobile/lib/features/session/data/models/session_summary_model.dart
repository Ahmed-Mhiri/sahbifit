import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_summary_model.freezed.dart';
part 'session_summary_model.g.dart';

@freezed
abstract class SessionSummaryModel with _$SessionSummaryModel {
  const factory SessionSummaryModel({
    required String sessionId,
    required String title,
    required String startTime, // Received as ISO 8601 String
  }) = _SessionSummaryModel;

  factory SessionSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$SessionSummaryModelFromJson(json);
}