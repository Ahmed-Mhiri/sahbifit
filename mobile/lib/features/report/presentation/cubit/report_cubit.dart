import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/report/domain/usecases/create_report.dart';

part 'report_cubit.freezed.dart';
part 'report_state.dart';

@injectable
class ReportCubit extends Cubit<ReportState> {
  final CreateReport _createReport;

  ReportCubit(this._createReport) : super(const ReportState.initial());

  /// Submits a user report to the server.
  Future<void> submitReport({
    required String reportedUserId,
    required String reason,
    String? sessionId,
  }) async {
    emit(const ReportState.loading());
    try {
      final params = CreateReportParams(
        reportedUserId: reportedUserId,
        reason: reason,
        sessionId: sessionId,
      );
      await _createReport(params);
      emit(const ReportState.success());
    } on ServerFailure catch (e) {
      emit(ReportState.error(e.message));
    } catch (e) {
      emit(ReportState.error(e.toString()));
    }
  }
}