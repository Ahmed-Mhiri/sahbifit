part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  /// Dispatched when the user presses the login button.
  const factory AuthEvent.loginButtonPressed({
    required String phoneNumber,
    required String password,
  }) = _LoginButtonPressed;

  /// Dispatched when the user presses the final register button.
  /// We pass the complete `RegisterParams` object.
  const factory AuthEvent.registerButtonPressed({
    required RegisterParams params,
  }) = _RegisterButtonPressed;

  /// Dispatched when the user submits the OTP.
  const factory AuthEvent.verifySmsButtonPressed({
    required String phoneNumber,
    required String otp,
  }) = _VerifySmsButtonPressed;

  /// Dispatched when the user requests a new OTP.
  const factory AuthEvent.resendOtpButtonPressed({
    required String phoneNumber,
    required String recaptchaToken,
  }) = _ResendOtpButtonPressed;
}
