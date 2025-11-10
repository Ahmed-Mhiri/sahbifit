import 'package:equatable/equatable.dart';
import 'package:sahbifit/features/user/domain/entities/profile_visibility.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

/// Fetches a user profile.
/// If [userId] is null, fetches the currently authenticated user's profile.
class LoadProfile extends ProfileEvent {
  final String? userId;

  const LoadProfile({this.userId});

  @override
  List<Object?> get props => [userId];
}

/// Blocks the user with [userId].
class BlockUserEvent extends ProfileEvent {
  final String userId;

  const BlockUserEvent({required this.userId});

  @override
  List<Object?> get props => [userId];
}

/// Updates the current user's profile visibility.
class UpdateVisibilityEvent extends ProfileEvent {
  final ProfileVisibility visibility;

  const UpdateVisibilityEvent({required this.visibility});

  @override
  List<Object?> get props => [visibility];
}