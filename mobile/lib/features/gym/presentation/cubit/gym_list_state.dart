import 'package:equatable/equatable.dart';
import '../../domain/entities/gym.dart';

abstract class GymListState extends Equatable {
  const GymListState();

  @override
  List<Object> get props => [];
}

class GymListInitial extends GymListState {}

class GymListLoading extends GymListState {}

class GymListLoaded extends GymListState {
  final List<Gym> gyms;

  const GymListLoaded({required this.gyms});

  @override
  List<Object> get props => [gyms];
}

class GymListError extends GymListState {
  final String message;

  const GymListError({required this.message});

  @override
  List<Object> get props => [message];
}