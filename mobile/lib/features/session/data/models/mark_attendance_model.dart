import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/session/domain/enums/participant_status.dart';

part 'mark_attendance_model.freezed.dart';
part 'mark_attendance_model.g.dart';

@freezed
class MarkAttendanceModel with _$MarkAttendanceModel {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory MarkAttendanceModel({
    required String sessionId,
    required String participantUserId,
    @JsonKey(name: 'newStatus') // Match the DTO
    required ParticipantStatus status,
  }) = _MarkAttendanceModel;

  factory MarkAttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$MarkAttendanceModelFromJson(json);
}