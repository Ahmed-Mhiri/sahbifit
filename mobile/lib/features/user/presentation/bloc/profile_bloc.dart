import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/usecase/usecase.dart';
import 'package:sahbifit/features/user/domain/usecases/block_user.dart';
import 'package:sahbifit/features/user/domain/usecases/get_my_profile.dart';
import 'package:sahbifit/features/user/domain/usecases/get_user_profile.dart';
import 'package:sahbifit/features/user/domain/usecases/update_profile_visibility.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetMyProfile getMyProfile;
  final GetUserProfile getUserProfile;
  final BlockUser blockUser;
  final UpdateProfileVisibility updateProfileVisibility;
  // You would inject a service to get the current user's ID
  // final String currentAuthUserId = 'my-user-id'; // Placeholder

  ProfileBloc({
    required this.getMyProfile,
    required this.getUserProfile,
    required this.blockUser,
    required this.updateProfileVisibility,
  }) : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<BlockUserEvent>(_onBlockUser);
    on<UpdateVisibilityEvent>(_onUpdateVisibility);
  }

  Future<void> _onLoadProfile(
      LoadProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());

    // We need a way to know the current user's ID to check if `isCurrentUser`
    // This is often stored in an AuthBloc or secure storage.
    // For this example, we'll assume 'my-user-id' is the current user.
    const currentAuthUserId = 'my-user-id'; // Placeholder

    final isCurrentUser =
        event.userId == null || event.userId == currentAuthUserId;

    final result = isCurrentUser
        ? await getMyProfile(NoParams())
        : await getUserProfile(GetUserProfileParams(userId: event.userId!));

    result.fold(
      (failure) => emit(ProfileError(failure.message)),
      (user) => emit(ProfileLoaded(user: user, isCurrentUser: isCurrentUser)),
    );
  }

  Future<void> _onBlockUser(
      BlockUserEvent event, Emitter<ProfileState> emit) async {
    // Don't emit loading state, button shows its own feedback
    final result = await blockUser(BlockUserParams(userId: event.userId));

    result.fold(
      (failure) {
        // Emit a state to show a snackbar
        emit(ProfileUpdateFailed(failure.message));
        // Re-emit the last loaded state to keep the UI
        if (state is ProfileLoaded) {
          emit(state as ProfileLoaded);
        }
      },
      (success) {
        emit(ProfileUpdateSuccess('User blocked'));
        // After blocking, we might want to navigate away or reload
        // For now, just re-emit the loaded state
        if (state is ProfileLoaded) {
          emit(state as ProfileLoaded);
        }
      },
    );
  }

  Future<void> _onUpdateVisibility(
      UpdateVisibilityEvent event, Emitter<ProfileState> emit) async {
    final currentState = state;
    if (currentState is! ProfileLoaded || !currentState.isCurrentUser) {
      return; // Can only update your own profile
    }

    emit(ProfileLoading()); // Show loading as it's a settings change

    final result = await updateProfileVisibility(
        UpdateProfileVisibilityParams(visibility: event.visibility));

    result.fold(
      (failure) {
        emit(ProfileUpdateFailed(failure.message));
        // Re-emit the old loaded state
        emit(currentState);
      },
      (success) {
        emit(ProfileUpdateSuccess('Visibility updated'));
        // Reload the profile to show the new setting
        add(LoadProfile(userId: null));
      },
    );
  }
}