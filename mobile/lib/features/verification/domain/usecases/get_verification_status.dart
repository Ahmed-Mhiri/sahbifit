import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/verification/domain/entities/verification_status_entity.dart';
import 'package:sahbifit/features/verification/domain/repositories/verification_repository.dart';

@injectable
class GetVerificationStatus implements UseCase<VerificationStatusEntity, NoParams> {
  final VerificationRepository _repository;

  GetVerificationStatus(this._repository);

  @override
  Future<VerificationStatusEntity> call(NoParams params) async {
    return _repository.getVerificationStatus();
  }
}