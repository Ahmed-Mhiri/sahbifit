part of 'pending_rating_bloc.dart';

abstract class PendingRatingEvent extends Equatable {
  const PendingRatingEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load the list of pending ratings
class FetchPendingRatings extends PendingRatingEvent {}

/// Event triggered when submitting a single rating from the dialog
class SubmitRating extends PendingRatingEvent {
  final String sessionId;
  final String ratedUserId;
  final int ratingValue;
  final String comment;

  const SubmitRating({
    required this.sessionId,
    required this.ratedUserId,
    required this.ratingValue,
    required this.comment,
  });

  @override
  List<Object?> get props => [sessionId, ratedUserId, ratingValue, comment];
}