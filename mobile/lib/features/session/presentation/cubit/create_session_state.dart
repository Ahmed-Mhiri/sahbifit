part of 'create_session_cubit.dart';

enum CreateSessionStatus { initial, loading, success, error }


@freezed
sealed class CreateSessionState with _$CreateSessionState {
  const factory CreateSessionState({
    @Default(CreateSessionStatus.initial) CreateSessionStatus status,
    @Default('') String title,
    Gym? selectedGym,
    @Default(SessionType.group) SessionType sessionType,
    required DateTime startTime,
    required DateTime endTime,
    @Default(3) int maxParticipants,
    String? errorMessage,
    Session? createdSession,
  }) = _CreateSessionState;

  factory CreateSessionState.initial(
          {required DateTime startTime, required DateTime endTime}) =>
      CreateSessionState(startTime: startTime, endTime: endTime);
}
