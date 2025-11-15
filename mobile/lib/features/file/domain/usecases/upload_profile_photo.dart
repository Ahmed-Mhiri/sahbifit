import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/file/domain/repositories/file_repository.dart';

@injectable
class UploadProfilePhoto implements UseCase<String, UploadProfilePhotoParams> {
  final FileRepository _repository;

  UploadProfilePhoto(this._repository);

  @override
  Future<String> call(UploadProfilePhotoParams params) async {
    return _repository.uploadImage(params.file);
  }
}

class UploadProfilePhotoParams extends Equatable {
  final File file;
  const UploadProfilePhotoParams({required this.file});
  @override
  List<Object?> get props => [file];
}