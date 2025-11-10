import '../../../../core/constants/api_endpoints.dart';
import '../models/login_request_model.dart';
import '../models/register_request_model.dart';
import '../models/verify_sms_request_model.dart';
import '../models/resend_otp_request_model.dart';
import '../models/auth_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(LoginRequestModel loginRequest);
  Future<String> register(RegisterRequestModel registerRequest);
  Future<String> verifySms(VerifySmsRequestModel verifySmsRequest);
  Future<String> resendOtp(ResendOtpRequestModel resendOtpRequest);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<AuthResponseModel> login(LoginRequestModel loginRequest) async {
    final response = await apiClient.post(
      ApiEndpoints.login,
      data: loginRequest.toJson(),
    );
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<String> register(RegisterRequestModel registerRequest) async {
    final response = await apiClient.post(
      ApiEndpoints.register,
      data: registerRequest.toJson(),
    );
    return response.data as String;
  }

  @override
  Future<String> verifySms(VerifySmsRequestModel verifySmsRequest) async {
    final response = await apiClient.post(
      ApiEndpoints.verifySms,
      data: verifySmsRequest.toJson(),
    );
    return response.data as String;
  }

  @override
  Future<String> resendOtp(ResendOtpRequestModel resendOtpRequest) async {
    final response = await apiClient.post(
      ApiEndpoints.resendOtp,
      data: resendOtpRequest.toJson(),
    );
    return response.data as String;
  }
}