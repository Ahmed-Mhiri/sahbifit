import 'package:equatable/equatable.dart';

/// Represents the different states of the Report UI.
abstract class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

/// The initial state, form is ready to be filled.
class ReportInitial extends ReportState {}

/// State when the report is being submitted to the backend.
class ReportLoading extends ReportState {}

/// State when the report was successfully submitted.
class ReportSuccess extends ReportState {}

/// State when an error occurred during submission.
class ReportFailure extends ReportState {
  final String message;

  const ReportFailure(this.message);

  @override
  List<Object> get props => [message];
}