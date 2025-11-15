import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/exceptions.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/report/data/datasources/report_remote_datasource.dart';
import 'package:sahbifit/features/report/data/models/create_report_model.dart';
import 'package:sahbifit/features/report/domain/repositories/report_repository.dart';

@Injectable(as: ReportRepository)
class ReportRepositoryImpl implements ReportRepository {
  final ReportRemoteDatasource _remoteDatasource;

  ReportRepositoryImpl(this._remoteDatasource);

  @override
  Future<void> createReport({
    required String reportedUserId,
    required String reason,
    String? sessionId,
  }) async {
    try {
      final requestModel = CreateReportModel(
        reportedUserId: reportedUserId,
        reason: reason,
        sessionId: sessionId,
      );
      await _remoteDatasource.createReport(requestModel);
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }
}
