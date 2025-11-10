import '../repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser({required this.repository});

  Future<String> call({
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
    return await repository.register(
      phoneNumber: phoneNumber,
      password: password,
      recaptchaToken: recaptchaToken,
      firstName: firstName,
      dateOfBirth: dateOfBirth,
      primaryGymId: primaryGymId,
      profilePhotoUrl: profilePhotoUrl,
      goalTagIds: goalTagIds,
      scheduleTagIds: scheduleTagIds,
    );
  }
}