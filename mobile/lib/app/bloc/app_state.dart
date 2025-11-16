part of 'app_bloc.dart';

@freezed
sealed class AppState with _$AppState {
  /// The initial state before any auth check has been performed.
  const factory AppState.initial() = _Initial;

  /// The state when a user is successfully authenticated (token exists).
  // AFTER
  const factory AppState.authenticated() = _Authenticated; // <-- MODIFIED

  /// The state when no user is authenticated (no token).
  const factory AppState.unauthenticated() = _Unauthenticated;
}