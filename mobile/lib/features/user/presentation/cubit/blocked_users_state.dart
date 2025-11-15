part of 'blocked_users_cubit.dart';

@freezed
sealed class BlockedUsersState with _$BlockedUsersState {
  const factory BlockedUsersState.initial() = _Initial;
  const factory BlockedUsersState.loading() = _Loading;
  const factory BlockedUsersState.loaded({
    required List<User> users,
    String? errorMessage,
  }) = _Loaded;
  const factory BlockedUsersState.error({required String message}) = _Error;
}