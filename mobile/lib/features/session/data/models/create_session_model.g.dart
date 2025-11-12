// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateSessionModelImpl _$$CreateSessionModelImplFromJson(
  Map<String, dynamic> json,
) => _$CreateSessionModelImpl(
  gymId: json['gymId'] as String,
  sessionType: $enumDecode(_$SessionTypeEnumMap, json['sessionType']),
  title: json['title'] as String,
  startTime: json['startTime'] as String,
  endTime: json['endTime'] as String,
  maxParticipants: (json['maxParticipants'] as num).toInt(),
);

Map<String, dynamic> _$$CreateSessionModelImplToJson(
  _$CreateSessionModelImpl instance,
) => <String, dynamic>{
  'gymId': instance.gymId,
  'sessionType': _$SessionTypeEnumMap[instance.sessionType]!,
  'title': instance.title,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'maxParticipants': instance.maxParticipants,
};

const _$SessionTypeEnumMap = {
  SessionType.group: 'group',
  SessionType.oneOnOne: 'one_on_one',
};
