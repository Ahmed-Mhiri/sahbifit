// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionSummaryModel _$SessionSummaryModelFromJson(Map<String, dynamic> json) =>
    _SessionSummaryModel(
      sessionId: json['sessionId'] as String,
      title: json['title'] as String,
      startTime: json['startTime'] as String,
    );

Map<String, dynamic> _$SessionSummaryModelToJson(
  _SessionSummaryModel instance,
) => <String, dynamic>{
  'sessionId': instance.sessionId,
  'title': instance.title,
  'startTime': instance.startTime,
};
