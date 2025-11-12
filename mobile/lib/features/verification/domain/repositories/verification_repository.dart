import 'dart:io';
import 'package:sahbifit/features/verification/domain/entities/verification_status_entity.dart';

abstract class VerificationRepository {
  Future<VerificationStatusEntity> getVerificationStatus();
  Future<void> submitVerificationVideo(File video);
}