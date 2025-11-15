import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/domain/usecases/get_my_blocked_users.dart';
import 'package:sahbifit/features/user/domain/usecases/unblock_user.dart';

part 'blocked_users_cubit.freezed.dart';
part 'blocked_users_state.dart';

@injectable
class BlockedUsersCubit extends Cubit<BlockedUsersState> {
  final GetMyBlockedUsers _getMyBlockedUsers;
  final UnblockUser _unblockUser;

  BlockedUsersCubit(this._getMyBlockedUsers, this._unblockUser)
      : super(const BlockedUsersState.initial());

  Future<void> loadBlockedUsers() async {
    emit(const BlockedUsersState.loading());
    try {
      final users = await _getMyBlockedUsers(NoParams());
      emit(BlockedUsersState.loaded(users: users));
    } on ServerFailure catch (e) {
      emit(BlockedUsersState.error(message: e.message));
    }
  }

  Future<void> unblockUser(String userId) async {
    // Optimistic: Don't show a loading spinner, just refresh the list.
    try {
      await _unblockUser(UnblockUserParams(userId: userId));
      // Refresh the list
      await loadBlockedUsers();
    } on ServerFailure catch (e) {
      // On error, emit the error but keep the old list
      state.maybeMap(
        loaded: (s) => emit(s.copyWith(errorMessage: e.message)),
        orElse: () => emit(BlockedUsersState.error(message: e.message)),
      );
    }
  }
}