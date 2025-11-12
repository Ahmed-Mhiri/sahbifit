import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/auth/data/models/register_request_model.dart';
import 'package:sahbifit/features/auth/domain/entities/auth_token.dart';

// Using a pattern that throws a Failure on error
abstract class AuthRepository {
  Future<AuthToken> login(String phoneNumber, String password);
  Future<void> register(RegisterRequestModel request);
  Future<void> verifySms(String phoneNumber, String otp);
  Future<void> resendOtp(String phoneNumber, String recaptchaToken);
}