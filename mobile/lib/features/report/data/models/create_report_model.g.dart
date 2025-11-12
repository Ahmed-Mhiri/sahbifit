// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateReportModelImpl _$$CreateReportModelImplFromJson(
  Map<String, dynamic> json,
) => _$CreateReportModelImpl(
  reportedUserId: json['reportedUserId'] as String,
  reason: json['reason'] as String,
  sessionId: json['sessionId'] as String?,
);

Map<String, dynamic> _$$CreateReportModelImplToJson(
  _$CreateReportModelImpl instance,
) => <String, dynamic>{
  'reportedUserId': instance.reportedUserId,
  'reason': instance.reason,
  'sessionId': instance.sessionId,
};
