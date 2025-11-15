import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/domain/enums/profile_visibility.dart';
import 'package:sahbifit/features/user/domain/usecases/get_my_profile.dart';
import 'package:sahbifit/features/user/domain/usecases/update_profile_visibility.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetMyProfile _getMyProfile;
  final UpdateProfileVisibility _updateProfileVisibility;

  ProfileBloc(
    this._getMyProfile,
    this._updateProfileVisibility,
  ) : super(const ProfileState.initial()) {
    on<_LoadMyProfile>(_onLoadMyProfile);
    on<_VisibilityChanged>(_onVisibilityChanged);
  }

  /// Handles fetching the current user's profile.
  Future<void> _onLoadMyProfile(
    _LoadMyProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    try {
      final user = await _getMyProfile(NoParams());
      emit(ProfileState.loaded(user: user));
    } on ServerFailure catch (e) {
      emit(ProfileState.error(e.message));
    } catch (e) {
      emit(ProfileState.error(e.toString()));
    }
  }

  /// Handles updating the user's profile visibility.
  Future<void> _onVisibilityChanged(
    _VisibilityChanged event,
    Emitter<ProfileState> emit,
  ) async {
    // You might want to show a more subtle loading,
    // e.g., by adding a bool to the 'Loaded' state:
    // emit(ProfileState.loaded(user: currentUser, isUpdating: true));
    emit(const ProfileState.loading());

    try {
      final params = UpdateProfileVisibilityParams(
        visibility: event.newVisibility,
      );
      await _updateProfileVisibility(params);

      // On success, dispatch an event to reload the profile
      // to get the updated user object.
      add(const ProfileEvent.loadMyProfile());
    } on ServerFailure catch (e) {
      emit(ProfileState.error(e.message));
    } catch (e) {
      emit(ProfileState.error(e.toString()));
    }
  }
}
