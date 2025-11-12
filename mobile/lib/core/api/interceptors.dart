import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:sahbifit/core/services/secure_storage_service.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final SecureStorageService _storageService;

  AuthInterceptor(this._storageService);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Read the token from storage
    final String? token = await _storageService.readToken();

    // Add the Authorization header if the token exists
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // 401 Unauthorized error
      print('--- 401 Unauthorized ---');
      
      // TODO: In Phase 2, this is where you'll trigger a logout.
      // For example, you might have a global AppBloc and add:
      // getIt<AppBloc>().add(const AppEvent.logoutRequested());
      
      // We can also clear the token
      _storageService.deleteToken();
    }
    return super.onError(err, handler);
  }
}