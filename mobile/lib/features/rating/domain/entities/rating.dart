import 'package:equatable/equatable.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';

class Rating extends Equatable {
  final String ratingId;
  final String sessionId; // Assuming we only need the ID on the client
  final User ratingBy;
  final User ratingFor;
  final int ratingValue; // 'Short' in Java maps to 'int' in Dart
  final String? comment;
  final DateTime createdAt;

  const Rating({
    required this.ratingId,
    required this.sessionId,
    required this.ratingBy,
    required this.ratingFor,
    required this.ratingValue,
    this.comment,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [ratingId, sessionId, ratingBy, ratingFor, ratingValue];
}