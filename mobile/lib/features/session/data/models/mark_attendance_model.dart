import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit_mobile/features/session/domain/enums/participant_status.dart';


/// Data Transfer Object (DTO) for marking attendance.
/// This maps directly to the backend's [MarkAttendanceDto.java].
@freezed
class MarkAttendanceModel with _$MarkAttendanceModel {
  @JsonSerializable(
    createFactory: false, // We only need toJson for sending data
    fieldRename: FieldRename.none, // Java fields are already camelCase
  )
  const factory MarkAttendanceModel({
    required String sessionId,
    required String participantUserId,
    required ParticipantStatus newStatus,
  }) = _MarkAttendanceModel;
}