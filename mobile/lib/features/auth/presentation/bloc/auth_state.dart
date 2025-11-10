part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String token;

  const AuthAuthenticated({required this.token});

  @override
  List<Object> get props => [token];
}

class AuthUnverified extends AuthState {
  final String phoneNumber;

  const AuthUnverified({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}

class RegistrationSuccess extends AuthState {
  final String message;

  const RegistrationSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class VerificationSuccess extends AuthState {
  final String message;

  const VerificationSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class OtpResent extends AuthState {
  final String message;

  const OtpResent({required this.message});

  @override
  List<Object> get props => [message];
}