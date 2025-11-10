import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'report_repository.dart';
// Assume a core usecase file exists
// import 'package:your_app/core/usecases/usecase.dart';

// Placeholder for UseCase
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// The Usecase for creating a report.
/// This encapsulates the specific business rule.
class CreateReport implements UseCase<void, CreateReportParams> {
  final ReportRepository repository;

  CreateReport(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateReportParams params) async {
    // Convert Usecase params to the model required by the repository
    final createReportModel = CreateReportModel(
      reportedUserId: params.reportedUserId,
      reason: params.reason,
      sessionId: params.sessionId,
    );

    return await repository.createReport(createReportModel);
  }
}

/// Parameters required by the [CreateReport] usecase.
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