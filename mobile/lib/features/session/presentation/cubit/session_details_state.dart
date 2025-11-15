part of 'session_details_cubit.dart';

@freezed
sealed class SessionDetailsState with _$SessionDetailsState {
  const factory SessionDetailsState.initial() = _Initial;
  const factory SessionDetailsState.loading() = _Loading;
  const factory SessionDetailsState.loaded({
    required Session session,
    required List<SessionParticipant> participants,
    required bool isJoined,
    @Default(false) bool isJoinLoading,
    String? errorMessage,
  }) = _Loaded;
  const factory SessionDetailsState.error(String message) = _Error;
}
