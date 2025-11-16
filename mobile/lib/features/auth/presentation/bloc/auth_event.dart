// lib/features/auth/presentation/bloc/auth_event.dart
part of 'auth_bloc.dart';

// NO IMPORTS ALLOWED HERE

@freezed
sealed class AuthEvent with _$AuthEvent {
  /// Dispatched when the user presses the login button.
  const factory AuthEvent.loginButtonPressed({
    required String phoneNumber,
    required String password,
  }) = _LoginButtonPressed;

  /// Dispatched when the user presses 'Next' on step 1 of registration.
  const factory AuthEvent.nextStepPressed({
    required String phoneNumber,
    required String password,
  }) = _NextStepPressed;

  /// Dispatched when the user presses the final register button.
  /// We pass the params and the optional image file.
  const factory AuthEvent.registerButtonPressed({
    required RegisterParams params,
    File? profileImageFile, // This File type is now imported from auth_bloc.dart
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