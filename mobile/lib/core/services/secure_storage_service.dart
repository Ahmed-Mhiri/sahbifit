import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecureStorageService {
  final FlutterSecureStorage _storage;

  // Use const for keys
  static const String _keyToken = 'jwt_token';

  SecureStorageService(this._storage);

  Future<void> writeToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
  }

  Future<String?> readToken() async {
    return await _storage.read(key: _keyToken);
}

  Future<void> deleteToken() async {
    await _storage.delete(key: _keyToken);
  }
}

// We need to tell GetIt how to create FlutterSecureStorage
@module
abstract class StorageModule {
  @lazySingleton
  FlutterSecureStorage get storage => const FlutterSecureStorage();
}