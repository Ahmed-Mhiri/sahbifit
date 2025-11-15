part of 'mark_attendance_cubit.dart';

@freezed
sealed class MarkAttendanceState with _$MarkAttendanceState {
  const factory MarkAttendanceState.initial() = _Initial;
  const factory MarkAttendanceState.loading() = _Loading;
  const factory MarkAttendanceState.loaded({
    required Session session,
    required List<SessionParticipant> participants,
    @Default(false) bool isSubmitting,
    String? errorMessage,
  }) = _Loaded;
  const factory MarkAttendanceState.error(String message) = _Error;
}
