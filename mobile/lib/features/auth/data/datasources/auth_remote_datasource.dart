import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/api/api_client.dart';
import 'package:sahbifit/core/constants/api_endpoints.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/features/auth/data/models/auth_response_model.dart';
import 'package:sahbifit/features/auth/data/models/login_request_model.dart';
import 'package:sahbifit/features/auth/data/models/register_request_model.dart';
import 'package:sahbifit/features/auth/data/models/resend_otp_request_model.dart';
import 'package:sahbifit/features/auth/data/models/verify_sms_request_model.dart';

// This is the abstract interface
abstract class AuthRemoteDatasource {
  Future<AuthResponseModel> login(LoginRequestModel request);
  Future<void> register(RegisterRequestModel request);
  Future<void> verifySms(VerifySmsRequestModel request);
  Future<void> resendOtp(ResendOtpRequestModel request);
}

@Injectable(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiClient _apiClient;

  AuthRemoteDatasourceImpl(this._apiClient);

  @override
  Future<AuthResponseModel> login(LoginRequestModel request) async {
    try {
      final response = await _apiClient.dio.post(
        ApiEndpoints.login, // <-- USE CONSTANT
        data: request.toJson(),
      );
      return AuthResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<void> register(RegisterRequestModel request) async {
    try {
      await _apiClient.dio.post(
        ApiEndpoints.register, // <-- USE CONSTANT
        data: request.toJson(),
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<void> verifySms(VerifySmsRequestModel request) async {
    try {
      await _apiClient.dio.post(
        ApiEndpoints.verifySms, // <-- USE CONSTANT
        data: request.toJson(),
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }

  @override
  Future<void> resendOtp(ResendOtpRequestModel request) async {
    try {
      await _apiClient.dio.post(
        ApiEndpoints.resendOtp, // <-- USE CONSTANT
        data: request.toJson(),
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}
