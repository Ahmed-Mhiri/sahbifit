import 'package:equatable/equatable.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
sealed class MySessionsState extends Equatable {
  const MySessionsState();

  @override
  List<Object> get props => [];
}

final class MySessionsInitial extends MySessionsState {}

final class MySessionsLoading extends MySessionsState {}

final class MySessionsLoaded extends MySessionsState {
  final List<Session> upcomingSessions;
  final List<Session> pastSessions;

  const MySessionsLoaded({
    required this.upcomingSessions,
    required this.pastSessions,
  });

  @override
  List<Object> get props => [upcomingSessions, pastSessions];
}

final class MySessionsError extends MySessionsState {
  final String message;

  const MySessionsError(this.message);

  @override
  List<Object> get props => [message];
}