
import 'package:sahbifit_mobile/features/auth/data/models/auth_response_model.dart';

abstract class AuthRepository {
  Future<AuthResponseModel> login(String phoneNumber, String password);
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
  });
  Future<String> verifySms(String phoneNumber, String otp);
  Future<String> resendOtp(String phoneNumber, String recaptchaToken);
}