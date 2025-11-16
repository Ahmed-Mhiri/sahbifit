import 'dart:io'; // ADDED
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:sahbifit/app/bloc/app_bloc.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/core/services/recaptcha_service.dart';
import 'package:sahbifit/features/auth/domain/usecases/login_user.dart';
import 'package:sahbifit/features/auth/domain/usecases/register_user.dart';
import 'package:sahbifit/features/auth/domain/usecases/resend_otp.dart';
import 'package:sahbifit/features/auth/domain/usecases/verify_sms.dart';
import 'package:sahbifit/features/file/domain/usecases/upload_profile_photo.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser _loginUser;
  final RegisterUser _registerUser;
  final VerifySms _verifySms;
  final ResendOtp _resendOtp;
  final AppBloc _appBloc;
  final UploadProfilePhoto _uploadProfilePhoto;
  final ReCaptchaService _reCaptchaService;

  AuthBloc(
    this._loginUser,
    this._registerUser,
    this._verifySms,
    this._resendOtp,
    this._appBloc,
    this._uploadProfilePhoto,
    this._reCaptchaService,
  ) : super(const AuthState.initial()) {
    on<_LoginButtonPressed>(_onLoginButtonPressed);
    on<_NextStepPressed>(_onNextStepPressed);
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

      _appBloc.add(const AppEvent.checkAuthStatus());
      emit(const AuthState.loginSuccess());
    } on ServerFailure catch (e) {
      emit(AuthState.failure(e.message));
    } catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  Future<void> _onNextStepPressed(
    _NextStepPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final token = await _reCaptchaService.getToken('register');
      emit(AuthState.registerStep1Success(
        phoneNumber: event.phoneNumber,
        password: event.password,
        recaptchaToken: token,
      ));
    } on ServerFailure catch (e) {
      emit(AuthState.failure(e.message));
    } catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  // --- REWRITTEN METHOD ---
  Future<void> _onRegisterButtonPressed(
    _RegisterButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      String? profilePhotoUrl;

      // 1. Upload image if one was provided
      if (event.profileImageFile != null) {
        // Use injected use case
        profilePhotoUrl = await _uploadProfilePhoto(
          UploadProfilePhotoParams(file: event.profileImageFile!),
        );
      }

      // 2. Create final RegisterParams with the new URL
      // We can't use copyWith, so we rebuild the object
      final finalParams = RegisterParams(
        phoneNumber: event.params.phoneNumber,
        password: event.params.password,
        recaptchaToken: event.params.recaptchaToken,
        firstName: event.params.firstName,
        dateOfBirth: event.params.dateOfBirth,
        primaryGymId: event.params.primaryGymId,
        goalTagIds: event.params.goalTagIds,
        scheduleTagIds: event.params.scheduleTagIds,
        profilePhotoUrl: profilePhotoUrl, // Pass the (potentially null) URL
      );

      // 3. Call the register use case
      await _registerUser(finalParams);

      // 4. Emit success
      emit(AuthState.registrationSuccess(
        phoneNumber: event.params.phoneNumber,
      ));
    } on ServerFailure catch (e) {
      emit(AuthState.failure(e.message));
    } catch (e) {
      // This will catch errors from both file upload and registration
      emit(AuthState.failure(e.toString()));
    }
  }
  // --- END REWRITE ---

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