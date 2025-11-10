import 'package:equatable/equatable.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final User user;
  final bool isCurrentUser;

  const ProfileLoaded({required this.user, required this.isCurrentUser});

  @override
  List<Object> get props => [user, isCurrentUser];
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object> get props => [message];
}

// Ephemeral state to show a success message (e.g., in a SnackBar)
class ProfileUpdateSuccess extends ProfileState {
  final String message;
  const ProfileUpdateSuccess(this.message);

  @override
  List<Object> get props => [message];
}

// Ephemeral state to show an error message
class ProfileUpdateFailed extends ProfileState {
  final String message;
  const ProfileUpdateFailed(this.message);

  @override
  List<Object> get props => [message];
}