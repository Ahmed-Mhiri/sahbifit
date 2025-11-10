part of 'verification_cubit.dart';

abstract class VerificationState extends Equatable {
  const VerificationState();

  @override
  List<Object> get props => [];
}

// Initial state, nothing has happened
class VerificationInitial extends VerificationState {}

// For loading status or uploading video
class VerificationLoading extends VerificationState {}

// Main state: we have the user's status
class VerificationStatusLoaded extends VerificationState {
  final VerificationStatusModel statusModel;

  const VerificationStatusLoaded(this.statusModel);

  @override
  List<Object> get props => [statusModel];
}

// Optional: A temporary state for showing a success message after upload
class VerificationSubmissionSuccess extends VerificationState {
  final String message;

  const VerificationSubmissionSuccess(this.message);
  
  @override
  List<Object> get props => [message];
}

// For any API errors
class VerificationError extends VerificationState {
  final String message;

  const VerificationError(this.message);

  @override
  List<Object> get props => [message];
}