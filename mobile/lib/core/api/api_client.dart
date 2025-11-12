import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/api/interceptors.dart';

@lazySingleton
class ApiClient {
  final Dio dio;

  ApiClient(AuthInterceptor authInterceptor)
      : dio = Dio(
          BaseOptions(
            // IMPORTANT: Change YOUR_IP to your computer's IP address
            // (e.g., 192.168.1.5) or 'localhost' if using web.
            baseUrl: 'http://YOUR_IP:8080/api', 
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