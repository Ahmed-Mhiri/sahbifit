part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  /// The default, idle state of the auth forms.
  const factory AuthState.initial() = _Initial;

  /// The state when an auth operation (login, register, etc.) is in progress.
  const factory AuthState.loading() = _Loading;

  /// State emitted upon successful login.
  const factory AuthState.loginSuccess() = _LoginSuccess;

  /// State emitted upon successful registration.
  /// We pass the phone number to the VerifySmsPage.
  const factory AuthState.registrationSuccess({
    required String phoneNumber,
  }) = _RegistrationSuccess;

  /// State emitted upon successful SMS verification.
  const factory AuthState.verificationSuccess() = _VerificationSuccess;

  /// State emitted when a new OTP is successfully sent.
  const factory AuthState.otpResent() = _OtpResent;

  /// The state when an auth operation fails.
  /// The [message] will be displayed to the user.
  const factory AuthState.failure(String message) = _Failure;
}