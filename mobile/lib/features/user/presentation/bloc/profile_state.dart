part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  /// The initial state, before the profile has been loaded.
  const factory ProfileState.initial() = _Initial;

  /// The state while the profile is being fetched or updated.
  const factory ProfileState.loading() = _Loading;

  /// The state when the user's profile has been successfully loaded.
  const factory ProfileState.loaded({required User user}) = _Loaded;

  /// The state when an error occurred while fetching or updating.
  const factory ProfileState.error(String message) = _Error;
}