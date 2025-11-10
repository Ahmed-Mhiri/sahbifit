// Import the model from the login_user.dart file, or wherever it is defined
import 'package:sahbifit_mobile/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:sahbifit_mobile/features/auth/data/models/login_request_model.dart';
import 'package:sahbifit_mobile/features/auth/data/models/register_request_model.dart';
import 'package:sahbifit_mobile/features/auth/data/models/resend_otp_request_model.dart';
import 'package:sahbifit_mobile/features/auth/data/models/verify_sms_request_model.dart';
import 'package:sahbifit_mobile/features/auth/domain/repositories/auth_repository.dart';

import '../models/auth_response_model.dart'; 

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  // Helper function to ensure phone number is in backend format
  String _stripCountryCode(String phoneNumber) {
    if (phoneNumber.startsWith('+216')) {
      return phoneNumber.substring(4); // Removes '+216'
    }
    // Add other prefixes if necessary, e.g., '00216'
    if (phoneNumber.startsWith('00216')) {
      return phoneNumber.substring(5); // Removes '00216'
    }
    // Assume it's already in the correct format if it doesn't match
    return phoneNumber;
  }

  @override
  Future<AuthResponseModel> login(String phoneNumber, String password) async {
    final formattedPhoneNumber = _stripCountryCode(phoneNumber);
    final request = LoginRequestModel(
      phoneNumber: formattedPhoneNumber,
      password: password,
    );
    return await remoteDataSource.login(request);
  }

  @override
  Future<String> register({
    required String phoneNumber,
    required String password,
    required String recaptchaToken,
    required String firstName,
    required String dateOfBirth,
    required String primaryGymId,
    String? profilePhotoUrl,
    required List<int> goalTagIds,
    required List<int> scheduleTagIds,
  }) async {
    final formattedPhoneNumber = _stripCountryCode(phoneNumber);
    final request = RegisterRequestModel(
      phoneNumber: formattedPhoneNumber,
      password: password,
      recaptchaToken: recaptchaToken,
      firstName: firstName,
      dateOfBirth: dateOfBirth,
      primaryGymId: primaryGymId,
      profilePhotoUrl: profilePhotoUrl,
      goalTagIds: goalTagIds,
      scheduleTagIds: scheduleTagIds,
    );
    return await remoteDataSource.register(request);
  }

  @override
  Future<String> verifySms(String phoneNumber, String otp) async {
    final formattedPhoneNumber = _stripCountryCode(phoneNumber);
    final request = VerifySmsRequestModel(
      phoneNumber: formattedPhoneNumber,
      otp: otp,
    );
    return await remoteDataSource.verifySms(request);
  }

  @override
  Future<String> resendOtp(String phoneNumber, String recaptchaToken) async {
    final formattedPhoneNumber = _stripCountryCode(phoneNumber);
    final request = ResendOtpRequestModel(
      phoneNumber: formattedPhoneNumber,
      recaptchaToken: recaptchaToken,
    );
    return await remoteDataSource.resendOtp(request);
  }
}