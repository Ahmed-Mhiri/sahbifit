import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/core/services/secure_storage_service.dart';
import 'package:sahbifit/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:sahbifit/features/auth/data/models/login_request_model.dart';
import 'package:sahbifit/features/auth/data/models/register_request_model.dart';
import 'package:sahbifit/features/auth/data/models/resend_otp_request_model.dart';
import 'package:sahbifit/features/auth/data/models/verify_sms_request_model.dart';
import 'package:sahbifit/features/auth/domain/entities/auth_token.dart';
import 'package:sahbifit/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  final SecureStorageService _storageService;

  AuthRepositoryImpl(this._remoteDatasource, this._storageService);

  @override
  Future<AuthToken> login(String phoneNumber, String password) async {
    try {
      final requestModel = LoginRequestModel(
        phoneNumber: phoneNumber,
        password: password,
      );
      final responseModel = await _remoteDatasource.login(requestModel);

      // --- 
      // 💡 KEY REQUIREMENT: Write the token to secure storage
      // ---
      await _storageService.writeToken(responseModel.jwtToken);
      
      return responseModel.toEntity();
    } on ServerException catch(e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<void> register(RegisterRequestModel request) async {
    try {
      await _remoteDatasource.register(request);
    } on ServerException catch(e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<void> verifySms(String phoneNumber, String otp) async {
    try {
      final requestModel = VerifySmsRequestModel(
        phoneNumber: phoneNumber,
        otp: otp,
      );
      await _remoteDatasource.verifySms(requestModel);
    } on ServerException catch(e) {
      throw ServerFailure(message: e.message);
    }
  }
    
  @override
  Future<void> resendOtp(String phoneNumber, String recaptchaToken) async {
    try {
      final requestModel = ResendOtpRequestModel(
        phoneNumber: phoneNumber,
        recaptchaToken: recaptchaToken,
      );
      await _remoteDatasource.resendOtp(requestModel);
    } on ServerException catch(e) {
      throw ServerFailure(message: e.message);
    }
  }
}