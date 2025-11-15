part of 'submit_gym_cubit.dart';

@freezed
sealed class SubmitGymState with _$SubmitGymState {
  /// The initial state, before any submission.
  const factory SubmitGymState.initial() = _Initial;

  /// The state while the gym is being submitted.
  const factory SubmitGymState.loading() = _Loading;

  /// The state when the gym submission is successful.
  const factory SubmitGymState.success() = _Success;

  /// The state when an error occurs.
  const factory SubmitGymState.error(String message) = _Error;
}
