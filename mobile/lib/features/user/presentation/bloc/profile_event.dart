part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  /// Dispatched to fetch the current user's profile (e.g., when the page loads).
  const factory ProfileEvent.loadMyProfile() = _LoadMyProfile;

  /// Dispatched when the user changes their visibility setting.
  const factory ProfileEvent.visibilityChanged({
    required ProfileVisibility newVisibility,
  }) = _VisibilityChanged;
}