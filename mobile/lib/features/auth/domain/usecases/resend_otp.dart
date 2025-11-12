import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/auth/domain/repositories/auth_repository.dart';

@injectable
class ResendOtp implements UseCase<void, ResendOtpParams> {
  final AuthRepository _repository;

  ResendOtp(this._repository);

  @override
  Future<void> call(ResendOtpParams params) async {
    return _repository.resendOtp(params.phoneNumber, params.recaptchaToken);
  }
}

class ResendOtpParams extends Equatable {
  final String phoneNumber;
  final String recaptchaToken;

  const ResendOtpParams({required this.phoneNumber, required this.recaptchaToken});

  @override
  List<Object?> get props => [phoneNumber, recaptchaToken];
}