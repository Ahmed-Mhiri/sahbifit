import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/api/api_client.dart';
import 'package:sahbifit/core/constants/api_endpoints.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/features/report/data/models/create_report_model.dart';

abstract class ReportRemoteDatasource {
  Future<void> createReport(CreateReportModel request);
}

@Injectable(as: ReportRemoteDatasource)
class ReportRemoteDatasourceImpl implements ReportRemoteDatasource {
  final ApiClient _apiClient;

  ReportRemoteDatasourceImpl(this._apiClient);

  @override
  Future<void> createReport(CreateReportModel request) async {
    try {
      await _apiClient.dio.post(
        ApiEndpoints.reports,
        data: request.toJson(),
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    }
  }
}
