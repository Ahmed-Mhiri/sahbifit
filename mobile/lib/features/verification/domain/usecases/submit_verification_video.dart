import '../repositories/verification_repository.dart';

class SubmitVerificationVideo {
  final VerificationRepository repository;

  SubmitVerificationVideo(this.repository);

  Future<String> call(String videoPath) async {
    return await repository.submitVerificationVideo(videoPath);
  }
}