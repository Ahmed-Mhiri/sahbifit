import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/file/data/datasources/file_remote_datasource.dart';
import 'package:sahbifit/features/file/domain/repositories/file_repository.dart';

@Injectable(as: FileRepository)
class FileRepositoryImpl implements FileRepository {
  final FileRemoteDatasource _remoteDatasource;

  FileRepositoryImpl(this._remoteDatasource);

  @override
  Future<String> uploadImage(File file) async {
    try {
      return await _remoteDatasource.uploadImage(file);
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }
}