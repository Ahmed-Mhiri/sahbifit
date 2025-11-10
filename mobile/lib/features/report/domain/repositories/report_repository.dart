import 'package:dartz/dartz.dart';
import 'create_report_model.dart';
// Assume a core failure file exists
// import 'package:your_app/core/error/failure.dart';

// Placeholder for Failure classes
abstract class Failure {}
class ServerFailure extends Failure {}

/// The abstract repository (contract) for the report feature.
/// This defines *what* can be done, not *how*.
abstract class ReportRepository {
  /// Creates a new report on the backend.
  /// Returns [Right] with void on success.
  /// Returns [Left] with a [Failure] on error.
  Future<Either<Failure, void>> createReport(CreateReportModel createReportModel);
}