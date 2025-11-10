import 'package:sahbifit_mobile/features/verification/data/models/verification_status_model.dart';

import '../repositories/verification_repository.dart';

class GetVerificationStatus {
  final VerificationRepository repository;

  GetVerificationStatus(this.repository);

  Future<VerificationStatusModel> call() async {
    return await repository.getVerificationStatus();
  }
}