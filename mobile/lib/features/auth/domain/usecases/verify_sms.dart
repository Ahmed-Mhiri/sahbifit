import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/auth/domain/repositories/auth_repository.dart';

@injectable
class VerifySms implements UseCase<void, VerifySmsParams> {
  final AuthRepository _repository;

  VerifySms(this._repository);

  @override
  Future<void> call(VerifySmsParams params) async {
    return _repository.verifySms(params.phoneNumber, params.otp);
  }
}

class VerifySmsParams extends Equatable {
  final String phoneNumber;
  final String otp;

  const VerifySmsParams({required this.phoneNumber, required this.otp});

  @override
  List<Object?> get props => [phoneNumber, otp];
}
