import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/verification/domain/repositories/verification_repository.dart';

@injectable
class SubmitVerificationVideo implements UseCase<void, SubmitVerificationVideoParams> {
  final VerificationRepository _repository;

  SubmitVerificationVideo(this._repository);

  @override
  Future<void> call(SubmitVerificationVideoParams params) async {
    return _repository.submitVerificationVideo(params.video);
  }
}

class SubmitVerificationVideoParams extends Equatable {
  final File video;

  const SubmitVerificationVideoParams({required this.video});

  @override
  List<Object?> get props => [video];
}