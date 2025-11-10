part of 'pending_rating_bloc.dart';

abstract class PendingRatingState extends Equatable {
  const PendingRatingState();

  @override
  List<Object> get props => [];
}

class PendingRatingInitial extends PendingRatingState {}

/// State while the list of pending ratings is being fetched
class PendingRatingLoading extends PendingRatingState {}

/// State when the list is successfully loaded
class PendingRatingLoaded extends PendingRatingState {
  final List<PendingRating> pendingRatings;

  const PendingRatingLoaded(this.pendingRatings);

  @override
  List<Object> get props => [pendingRatings];
}

/// State when loading the list fails
class PendingRatingError extends PendingRatingState {
  final String message;

  const PendingRatingError(this.message);

  @override
  List<Object> get props => [message];
}

/// State while a single rating is being submitted
class RatingSubmissionLoading extends PendingRatingState {}

/// State when a single rating is submitted successfully
class RatingSubmissionSuccess extends PendingRatingState {}

/// State when submitting a single rating fails
class RatingSubmissionError extends PendingRatingState {
  final String message;

  const RatingSubmissionError(this.message);

  @override
  List<Object> get props => [message];
}