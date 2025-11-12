part of 'session_feed_cubit.dart';

@freezed
class SessionFeedState with _$SessionFeedState {
  /// The initial state, before any sessions are fetched.
  const factory SessionFeedState.initial() = _Initial;

  /// The state while sessions are being fetched from the API.
  const factory SessionFeedState.loading() = _Loading;

  /// The state when sessions have been successfully loaded.
  const factory SessionFeedState.loaded({
    required List<Session> sessions,
    VerifiedGender? genderFilter, // Store the filter that was used
  }) = _Loaded;

  /// The state when an error occurs during fetching.
  const factory SessionFeedState.error(String message) = _Error;
}