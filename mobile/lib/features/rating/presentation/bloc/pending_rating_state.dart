part of 'pending_rating_bloc.dart';

@freezed
sealed class PendingRatingState with _$PendingRatingState {
  /// The initial state, before anything is loaded.
  const factory PendingRatingState.initial() = _Initial;

  /// The state while fetching the list or submitting a rating.
  const factory PendingRatingState.loading() = _Loading;

  /// The state when the list of pending ratings is successfully loaded.
  const factory PendingRatingState.loaded({
    required List<PendingRating> pendingRatings,
  }) = _Loaded;

  /// A temporary state to indicate one rating was submitted successfully.
  /// The BLoC will likely transition from this back to 'loaded' with an updated list.
  const factory PendingRatingState.submissionSuccess() = _SubmissionSuccess;

  /// The state when an error occurs.
  const factory PendingRatingState.error(String message) = _Error;
}
