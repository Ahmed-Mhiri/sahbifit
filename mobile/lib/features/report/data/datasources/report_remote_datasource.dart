import 'package:dio/dio.dart';
import 'create_report_model.dart';
// Assume a core exception file exists
// import 'package:your_app/core/error/exception.dart'; 

// Placeholder for custom exception
class ServerException implements Exception {}

abstract class ReportRemoteDataSource {
  /// Calls the POST /api/reports endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<void> createReport(CreateReportModel createReportModel);
}

class ReportRemoteDataSourceImpl implements ReportRemoteDataSource {
  final Dio dio; // Use Dio for HTTP requests
  final String _endpoint = '/api/reports';

  ReportRemoteDataSourceImpl({required this.dio});

  @override
  Future<void> createReport(CreateReportModel createReportModel) async {
    try {
      final response = await dio.post(
        _endpoint,
        data: createReportModel.toJson(),
      );

      // The backend returns 201 Created with no body (ResponseEntity<Void>)
      if (response.statusCode == 201) {
        return;
      } else {
        // Handle other successful-but-not-expected statuses if necessary
        throw ServerException();
      }
    } on DioException {
      // Re-throw as a standardized ServerException
      throw ServerException();
    }
  }
}