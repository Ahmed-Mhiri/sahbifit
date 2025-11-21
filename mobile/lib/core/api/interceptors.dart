import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/app/bloc/app_bloc.dart';
import 'package:sahbifit/core/di/service_locator.dart';
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
    // Check for both 401 (Unauthorized) and 403 (Forbidden)
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      print('--- ${err.response?.statusCode} Auth Error: Dispatching LogoutRequested ---');

      // Use getIt to find the globally registered AppBloc
      // and add the logout event. The AppBloc will handle
      // deleting the token and updating the app's state.
      try {
        getIt<AppBloc>().add(const AppEvent.logoutRequested());
      } catch (e) {
        print('Failed to get AppBloc from getIt to dispatch logout: $e');
      }
    }
    return super.onError(err, handler);
  }
}