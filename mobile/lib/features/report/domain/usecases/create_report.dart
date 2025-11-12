import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/report/domain/repositories/report_repository.dart';

@injectable
class CreateReport implements UseCase<void, CreateReportParams> {
  final ReportRepository _repository;

  CreateReport(this._repository);

  @override
  Future<void> call(CreateReportParams params) async {
    return _repository.createReport(
      reportedUserId: params.reportedUserId,
      reason: params.reason,
      sessionId: params.sessionId,
    );
  }
}

class CreateReportParams extends Equatable {
  final String reportedUserId;
  final String reason;
  final String? sessionId;

  const CreateReportParams({
    required this.reportedUserId,
    required this.reason,
    this.sessionId,
  });

  @override
  List<Object?> get props => [reportedUserId, reason, sessionId];
}