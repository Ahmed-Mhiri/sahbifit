import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_report_model.freezed.dart';
part 'create_report_model.g.dart';


@freezed
abstract class CreateReportModel with _$CreateReportModel {
  
  const factory CreateReportModel({
    required String reportedUserId,
    required String reason,
    String? sessionId, // This is nullable in your DTO
  }) = _CreateReportModel;

  factory CreateReportModel.fromJson(Map<String, dynamic> json) =>
      _$CreateReportModelFromJson(json);
}
