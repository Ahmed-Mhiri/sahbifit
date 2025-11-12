// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_participant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionParticipantIdModelImpl _$$SessionParticipantIdModelImplFromJson(
  Map<String, dynamic> json,
) => _$SessionParticipantIdModelImpl(
  sessionId: json['sessionId'] as String,
  userId: json['userId'] as String,
);

Map<String, dynamic> _$$SessionParticipantIdModelImplToJson(
  _$SessionParticipantIdModelImpl instance,
) => <String, dynamic>{
  'sessionId': instance.sessionId,
  'userId': instance.userId,
};

_$SessionParticipantModelImpl _$$SessionParticipantModelImplFromJson(
  Map<String, dynamic> json,
) => _$SessionParticipantModelImpl(
  id: SessionParticipantIdModel.fromJson(json['id'] as Map<String, dynamic>),
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
  status: $enumDecode(_$ParticipantStatusEnumMap, json['status']),
  joinedAt: json['joinedAt'] as String,
);

Map<String, dynamic> _$$SessionParticipantModelImplToJson(
  _$SessionParticipantModelImpl instance,
) => <String, dynamic>{
  'id': instance.id.toJson(),
  'user': instance.user.toJson(),
  'status': _$ParticipantStatusEnumMap[instance.status]!,
  'joinedAt': instance.joinedAt,
};

const _$ParticipantStatusEnumMap = {
  ParticipantStatus.joined: 'joined',
  ParticipantStatus.attended: 'attended',
  ParticipantStatus.noShow: 'no_show',
  ParticipantStatus.left: 'left',
};
