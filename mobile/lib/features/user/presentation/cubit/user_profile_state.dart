// lib/features/user/presentation/cubit/user_profile_state.dart
part of 'user_profile_cubit.dart';

@freezed
sealed class UserProfileState with _$UserProfileState {
  /// The initial state, before the profile has been loaded.
  const factory UserProfileState.initial() = _Initial;

  /// The state while the profile is being fetched.
  const factory UserProfileState.loading() = _Loading;

  /// The state when the user's profile has been successfully loaded.
  const factory UserProfileState.loaded(User user) = _Loaded;

  /// The state when an error occurred while fetching.
  const factory UserProfileState.error(String message) = _Error;
}