part of 'app_bloc.dart';

@freezed
sealed class AppEvent with _$AppEvent {
  /// Dispatched on app startup to check if a valid token exists in storage.
  const factory AppEvent.checkAuthStatus() = _CheckAuthStatus;

  /// Dispatched when the user logs out or a 401 error is received.
  const factory AppEvent.logoutRequested() = _LogoutRequested;
}