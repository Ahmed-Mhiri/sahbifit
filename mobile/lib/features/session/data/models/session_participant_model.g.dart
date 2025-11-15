// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_participant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionParticipantIdModel _$SessionParticipantIdModelFromJson(
  Map<String, dynamic> json,
) => _SessionParticipantIdModel(
  sessionId: json['sessionId'] as String,
  userId: json['userId'] as String,
);

Map<String, dynamic> _$SessionParticipantIdModelToJson(
  _SessionParticipantIdModel instance,
) => <String, dynamic>{
  'sessionId': instance.sessionId,
  'userId': instance.userId,
};

_SessionParticipantModel _$SessionParticipantModelFromJson(
  Map<String, dynamic> json,
) => _SessionParticipantModel(
  id: SessionParticipantIdModel.fromJson(json['id'] as Map<String, dynamic>),
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
  status: $enumDecode(_$ParticipantStatusEnumMap, json['status']),
  joinedAt: json['joinedAt'] as String,
);

Map<String, dynamic> _$SessionParticipantModelToJson(
  _SessionParticipantModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user,
  'status': _$ParticipantStatusEnumMap[instance.status]!,
  'joinedAt': instance.joinedAt,
};

const _$ParticipantStatusEnumMap = {
  ParticipantStatus.joined: 'joined',
  ParticipantStatus.attended: 'attended',
  ParticipantStatus.noShow: 'no_show',
  ParticipantStatus.left: 'left',
};
