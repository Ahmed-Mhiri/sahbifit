import '../repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser({required this.repository});

  Future<String> call(String phoneNumber, String password) async {
    final response = await repository.login(phoneNumber, password);
    return response.jwtToken;
  }
}