import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/verification/data/datasources/verification_remote_datasource.dart';
import 'package:sahbifit/features/verification/domain/entities/verification_status_entity.dart';
import 'package:sahbifit/features/verification/domain/repositories/verification_repository.dart';

@Injectable(as: VerificationRepository)
class VerificationRepositoryImpl implements VerificationRepository {
  final VerificationRemoteDatasource _remoteDatasource;

  VerificationRepositoryImpl(this._remoteDatasource);

  @override
  Future<VerificationStatusEntity> getVerificationStatus() async {
    try {
      final statusModel = await _remoteDatasource.getVerificationStatus();
      return statusModel.toEntity();
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<void> submitVerificationVideo(File video) async {
    try {
      await _remoteDatasource.submitVerificationVideo(video);
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }
}
