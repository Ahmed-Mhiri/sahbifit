part of 'pending_rating_bloc.dart';

@freezed
sealed class PendingRatingEvent with _$PendingRatingEvent {
  /// Dispatched to load the initial list of pending ratings.
  const factory PendingRatingEvent.fetchList() = _FetchList;

  /// Dispatched when the user submits a rating for a specific user/session.
  const factory PendingRatingEvent.submitRating({
    required String sessionId,
    required String ratedUserId,
    required int ratingValue,
    String? comment,
  }) = _SubmitRating;
}
