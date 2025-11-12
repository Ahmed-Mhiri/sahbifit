// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateReportModel _$CreateReportModelFromJson(Map<String, dynamic> json) =>
    _CreateReportModel(
      reportedUserId: json['reportedUserId'] as String,
      reason: json['reason'] as String,
      sessionId: json['sessionId'] as String?,
    );

Map<String, dynamic> _$CreateReportModelToJson(_CreateReportModel instance) =>
    <String, dynamic>{
      'reportedUserId': instance.reportedUserId,
      'reason': instance.reason,
      'sessionId': instance.sessionId,
    };
