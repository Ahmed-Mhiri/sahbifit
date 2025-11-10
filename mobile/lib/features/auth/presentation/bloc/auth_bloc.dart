import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sahbifit_mobile/features/auth/domain/usecases/login_user.dart';
import 'package:sahbifit_mobile/features/auth/domain/usecases/register_user.dart';
import 'package:sahbifit_mobile/features/auth/domain/usecases/resend_otp.dart';
import 'package:sahbifit_mobile/features/auth/domain/usecases/verify_sms.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  final RegisterUser registerUser;
  final VerifySms verifySms;
  final ResendOtp resendOtp;

  AuthBloc({
    required this.loginUser,
    required this.registerUser,
    required this.verifySms,
    required this.resendOtp,
  }) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<VerifySmsRequested>(_onVerifySmsRequested);
    on<ResendOtpRequested>(_onResendOtpRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final token = await loginUser(event.phoneNumber, event.password);
      emit(AuthAuthenticated(token: token));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final message = await registerUser.call(
        phoneNumber: event.phoneNumber,
        password: event.password,
        recaptchaToken: event.recaptchaToken,
        firstName: event.firstName,
        dateOfBirth: event.dateOfBirth,
        primaryGymId: event.primaryGymId,
        profilePhotoUrl: event.profilePhotoUrl,
        goalTagIds: event.goalTagIds,
        scheduleTagIds: event.scheduleTagIds,
      );
      emit(RegistrationSuccess(message: message));
      emit(AuthUnverified(phoneNumber: event.phoneNumber));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onVerifySmsRequested(
    VerifySmsRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final message = await verifySms(event.phoneNumber, event.otp);
      emit(VerificationSuccess(message: message));
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onResendOtpRequested(
    ResendOtpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final message = await resendOtp(event.phoneNumber, event.recaptchaToken);
      emit(OtpResent(message: message));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) {
    emit(AuthUnauthenticated());
  }
}