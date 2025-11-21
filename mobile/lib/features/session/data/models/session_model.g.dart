// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionModel _$SessionModelFromJson(Map<String, dynamic> json) =>
    _SessionModel(
      sessionId: json['sessionId'] as String,
      title: json['title'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      sessionType: $enumDecode(_$SessionTypeEnumMap, json['sessionType']),
      participantCount: (json['participantCount'] as num).toInt(),
      maxParticipants: (json['maxParticipants'] as num).toInt(),
      creator: UserSummaryModel.fromJson(
        json['creator'] as Map<String, dynamic>,
      ),
      gym: GymModel.fromJson(json['gym'] as Map<String, dynamic>),
      isChatActive: json['isChatActive'] as bool? ?? false,
    );

Map<String, dynamic> _$SessionModelToJson(_SessionModel instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'title': instance.title,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'sessionType': _$SessionTypeEnumMap[instance.sessionType]!,
      'participantCount': instance.participantCount,
      'maxParticipants': instance.maxParticipants,
      'creator': instance.creator,
      'gym': instance.gym,
      'isChatActive': instance.isChatActive,
    };

const _$SessionTypeEnumMap = {
  SessionType.group: 'group',
  SessionType.oneOnOne: 'one_on_one',
};
