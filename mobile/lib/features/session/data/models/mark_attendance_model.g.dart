// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarkAttendanceModelImpl _$$MarkAttendanceModelImplFromJson(
  Map<String, dynamic> json,
) => _$MarkAttendanceModelImpl(
  sessionId: json['sessionId'] as String,
  participantUserId: json['participantUserId'] as String,
  status: $enumDecode(_$ParticipantStatusEnumMap, json['newStatus']),
);

Map<String, dynamic> _$$MarkAttendanceModelImplToJson(
  _$MarkAttendanceModelImpl instance,
) => <String, dynamic>{
  'sessionId': instance.sessionId,
  'participantUserId': instance.participantUserId,
  'newStatus': _$ParticipantStatusEnumMap[instance.status]!,
};

const _$ParticipantStatusEnumMap = {
  ParticipantStatus.joined: 'joined',
  ParticipantStatus.attended: 'attended',
  ParticipantStatus.noShow: 'no_show',
  ParticipantStatus.left: 'left',
};
