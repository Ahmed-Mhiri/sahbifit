// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionModel _$SessionModelFromJson(Map<String, dynamic> json) =>
    _SessionModel(
      sessionId: json['sessionId'] as String,
      title: json['title'] as String,
      sessionType: $enumDecode(_$SessionTypeEnumMap, json['sessionType']),
      status: $enumDecode(_$SessionStatusEnumMap, json['status']),
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      maxParticipants: (json['maxParticipants'] as num).toInt(),
      participantCount: (json['participantCount'] as num).toInt(),
      creator: UserModel.fromJson(json['creator'] as Map<String, dynamic>),
      gym: GymModel.fromJson(json['gym'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionModelToJson(_SessionModel instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'title': instance.title,
      'sessionType': _$SessionTypeEnumMap[instance.sessionType]!,
      'status': _$SessionStatusEnumMap[instance.status]!,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'maxParticipants': instance.maxParticipants,
      'participantCount': instance.participantCount,
      'creator': instance.creator,
      'gym': instance.gym,
    };

const _$SessionTypeEnumMap = {
  SessionType.group: 'group',
  SessionType.oneOnOne: 'one_on_one',
};

const _$SessionStatusEnumMap = {
  SessionStatus.active: 'active',
  SessionStatus.cancelled: 'cancelled',
  SessionStatus.completed: 'completed',
};
