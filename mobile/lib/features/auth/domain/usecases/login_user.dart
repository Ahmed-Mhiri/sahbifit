import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/auth/domain/entities/auth_token.dart';
import 'package:sahbifit/features/auth/domain/repositories/auth_repository.dart';

@injectable
class LoginUser implements UseCase<AuthToken, LoginParams> {
  final AuthRepository _repository;

  LoginUser(this._repository);

  @override
  Future<AuthToken> call(LoginParams params) async {
    return _repository.login(params.phoneNumber, params.password);
  }
}

class LoginParams extends Equatable {
  final String phoneNumber;
  final String password;

  const LoginParams({required this.phoneNumber, required this.password});

  @override
  List<Object?> get props => [phoneNumber, password];
}
