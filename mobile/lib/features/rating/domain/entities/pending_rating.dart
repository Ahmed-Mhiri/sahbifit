import 'package:equatable/equatable.dart';

class PendingRating extends Equatable {
  final String sessionId;
  final String sessionTitle;
  final String userIdToRate;
  final String userNameToRate;

  const PendingRating({
    required this.sessionId,
    required this.sessionTitle,
    required this.userIdToRate,
    required this.userNameToRate,
  });

  @override
  List<Object?> get props => [sessionId, userIdToRate, userNameToRate];
}