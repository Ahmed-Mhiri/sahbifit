part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final String phoneNumber;
  final String password;

  const LoginRequested({
    required this.phoneNumber,
    required this.password,
  });

  @override
  List<Object> get props => [phoneNumber, password];
}

class RegisterRequested extends AuthEvent {
  final String phoneNumber;
  final String password;
  final String recaptchaToken;
  final String firstName;
  final String dateOfBirth;
  final String primaryGymId;
  final String? profilePhotoUrl;
  final List<int> goalTagIds;
  final List<int> scheduleTagIds;

  const RegisterRequested({
    required this.phoneNumber,
    required this.password,
    required this.recaptchaToken,
    required this.firstName,
    required this.dateOfBirth,
    required this.primaryGymId,
    this.profilePhotoUrl,
    required this.goalTagIds,
    required this.scheduleTagIds,
  });

  @override
  List<Object> get props => [
        phoneNumber,
        password,
        recaptchaToken,
        firstName,
        dateOfBirth,
        primaryGymId,
        goalTagIds,
        scheduleTagIds,
      ];
}

class VerifySmsRequested extends AuthEvent {
  final String phoneNumber;
  final String otp;

  const VerifySmsRequested({
    required this.phoneNumber,
    required this.otp,
  });

  @override
  List<Object> get props => [phoneNumber, otp];
}

class ResendOtpRequested extends AuthEvent {
  final String phoneNumber;
  final String recaptchaToken;

  const ResendOtpRequested({
    required this.phoneNumber,
    required this.recaptchaToken,
  });

  @override
  List<Object> get props => [phoneNumber, recaptchaToken];
}

class LogoutRequested extends AuthEvent {}