// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_participant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionParticipantModel _$SessionParticipantModelFromJson(
  Map<String, dynamic> json,
) => _SessionParticipantModel(
  user: UserSummaryModel.fromJson(json['user'] as Map<String, dynamic>),
  status: $enumDecode(_$ParticipantStatusEnumMap, json['status']),
  joinedAt: json['joinedAt'] as String,
);

Map<String, dynamic> _$SessionParticipantModelToJson(
  _SessionParticipantModel instance,
) => <String, dynamic>{
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
