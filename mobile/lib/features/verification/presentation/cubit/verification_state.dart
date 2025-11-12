part of 'verification_cubit.dart';

@freezed
class VerificationState with _$VerificationState {
  /// We haven't fetched the status yet.
  const factory VerificationState.initial() = _Initial;

  /// We are currently fetching the status.
  const factory VerificationState.loading() = _Loading;

  /// We have successfully fetched the status.
  const factory VerificationState.loaded(VerificationStatusEntity status) = _Loaded;

  /// An error occurred.
  const factory VerificationState.error(String message) = _Error;
}