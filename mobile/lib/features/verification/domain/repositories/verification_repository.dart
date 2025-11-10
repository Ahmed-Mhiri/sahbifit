import 'package:sahbifit_mobile/features/verification/data/models/verification_status_model.dart';


abstract class VerificationRepository {
  Future<VerificationStatusModel> getVerificationStatus();
  Future<String> submitVerificationVideo(String videoPath);
}