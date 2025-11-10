import '../repositories/auth_repository.dart';

class ResendOtp {
  final AuthRepository repository;

  ResendOtp({required this.repository});

  Future<String> call(String phoneNumber, String recaptchaToken) async {
    return await repository.resendOtp(phoneNumber, recaptchaToken);
  }
}