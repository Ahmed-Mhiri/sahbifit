import 'package:flutter_bloc/flutter_bloc.dart';
import 'report_state.dart';
import 'create_report.dart';
import 'report_repository.dart'; // For Failure types

class ReportCubit extends Cubit<ReportState> {
  final CreateReport createReport;

  ReportCubit({required this.createReport}) : super(ReportInitial());

  /// Submits the report to the backend.
  Future<void> submitReport({
    required String reportedUserId,
    required String reason,
    String? sessionId,
  }) async {
    // Emit loading state to show a spinner
    emit(ReportLoading());

    final params = CreateReportParams(
      reportedUserId: reportedUserId,
      reason: reason,
      sessionId: sessionId,
    );

    final result = await createReport(params);

    // Use fold to handle success (Right) or failure (Left)
    result.fold(
      (failure) {
        // Emit failure state with an error message
        emit(ReportFailure(_mapFailureToMessage(failure)));
      },
      (success) {
        // Emit success state
        emit(ReportSuccess());
      },
    );
  }

  /// Helper function to convert Failure objects to user-friendly strings.
  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return 'Server Error. Please try again later.';
    } else if (failure is NetworkFailure) {
      return 'No internet connection. Please check your network.';
    } else {
      return 'An unexpected error occurred.';
    }
  }
}