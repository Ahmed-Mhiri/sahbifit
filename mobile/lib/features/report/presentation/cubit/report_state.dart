part of 'report_cubit.dart';

@freezed
sealed class ReportState with _$ReportState {
  /// The initial, idle state of the report form.
  const factory ReportState.initial() = _Initial;

  /// The state when the report is being submitted to the API.
  const factory ReportState.loading() = _Loading;

  /// The state when the report has been successfully submitted.
  const factory ReportState.success() = _Success;

  /// The state when an error occurs during submission.
  const factory ReportState.error(String message) = _Error;
}
