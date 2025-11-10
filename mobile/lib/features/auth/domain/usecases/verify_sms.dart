import '../repositories/auth_repository.dart';

class VerifySms {
  final AuthRepository repository;

  VerifySms({required this.repository});

  Future<String> call(String phoneNumber, String otp) async {
    return await repository.verifySms(phoneNumber, otp);
  }
}