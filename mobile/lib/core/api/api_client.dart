import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/api/interceptors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // <-- ADDED IMPORT

@lazySingleton
class ApiClient {
  final Dio dio;

  ApiClient(AuthInterceptor authInterceptor)
      : dio = Dio(
          BaseOptions(
            // --- MODIFIED LINE ---
            baseUrl: dotenv.env['API_BASE_URL'] ?? 'http://localhost:8080/api',
            // --- END MODIFIED LINE ---
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        ) {
    // Add the auth interceptor to Dio's interceptor list
    dio.interceptors.add(authInterceptor);

    // You can add other interceptors here, like a logger
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }
}