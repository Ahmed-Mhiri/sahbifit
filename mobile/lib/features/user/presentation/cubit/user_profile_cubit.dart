// lib/features/user/presentation/cubit/user_profile_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/domain/usecases/get_user_profile.dart';

part 'user_profile_cubit.freezed.dart';
part 'user_profile_state.dart';

@injectable
class UserProfileCubit extends Cubit<UserProfileState> {
  final GetUserProfile _getUserProfile;

  UserProfileCubit(this._getUserProfile)
      : super(const UserProfileState.initial());

  /// Fetches a specific user's profile by their ID.
  Future<void> loadUserProfile(String userId) async {
    emit(const UserProfileState.loading());
    try {
      // Call the use case with the required parameters
      final user = await _getUserProfile(GetUserProfileParams(userId: userId));
      emit(UserProfileState.loaded(user));
    } on ServerFailure catch (e) {
      emit(UserProfileState.error(e.message));
    } catch (e) {
      emit(UserProfileState.error(e.toString()));
    }
  }
}