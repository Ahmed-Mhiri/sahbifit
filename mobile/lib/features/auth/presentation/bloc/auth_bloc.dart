import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:sahbifit/app/bloc/app_bloc.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/auth/domain/usecases/login_user.dart';
import 'package:sahbifit/features/auth/domain/usecases/register_user.dart';
import 'package:sahbifit/features/auth/domain/usecases/resend_otp.dart';
import 'package:sahbifit/features/auth/domain/usecases/verify_sms.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser _loginUser;
  final RegisterUser _registerUser;
  final VerifySms _verifySms;
  final ResendOtp _resendOtp;
  final AppBloc _appBloc; // Injected to dispatch events to the AppBloc

  AuthBloc(
    this._loginUser,
    this._registerUser,
    this._verifySms,
    this._resendOtp,
    this._appBloc,
  ) : super(const AuthState.initial()) {
    on<_LoginButtonPressed>(_onLoginButtonPressed);
    on<_RegisterButtonPressed>(_onRegisterButtonPressed);
    on<_VerifySmsButtonPressed>(_onVerifySmsButtonPressed);
    on<_ResendOtpButtonPressed>(_onResendOtpButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
    _LoginButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final params = LoginParams(
        phoneNumber: event.phoneNumber,
        password: event.password,
      );
      await _loginUser(params);

      // ---
      // 🚀 REQUIREMENT FULFILLED
      // On success, dispatch CheckAuthStatus to the AppBloc.
      // The AppBloc will read the new token and emit AppState.authenticated
      // ---
      _appBloc.add(const AppEvent.checkAuthStatus());

      emit(const AuthState.loginSuccess());
    } on ServerFailure catch (e) {
      emit(AuthState.failure(e.message));
    } catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  Future<void> _onRegisterButtonPressed(
    _RegisterButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      // The event already contains the complex RegisterParams
      await _registerUser(event.params);
      emit(AuthState.registrationSuccess(
        phoneNumber: event.params.phoneNumber,
      ));
    } on ServerFailure catch (e) {
      emit(AuthState.failure(e.message));
    } catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  Future<void> _onVerifySmsButtonPressed(
    _VerifySmsButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final params = VerifySmsParams(
        phoneNumber: event.phoneNumber,
        otp: event.otp,
      );
      await _verifySms(params);
      emit(const AuthState.verificationSuccess());
    } on ServerFailure catch (e) {
      emit(AuthState.failure(e.message));
    } catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  Future<void> _onResendOtpButtonPressed(
    _ResendOtpButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final params = ResendOtpParams(
        phoneNumber: event.phoneNumber,
        recaptchaToken: event.recaptchaToken,
      );
      await _resendOtp(params);
      emit(const AuthState.otpResent());
    } on ServerFailure catch (e) {
      emit(AuthState.failure(e.message));
    } catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }
}