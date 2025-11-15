import 'dart:io';

abstract class FileRepository {
  Future<String> uploadImage(File file);
}