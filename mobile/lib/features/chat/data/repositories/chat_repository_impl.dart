import 'package:dartz/dartz.dart';
import 'package:sahbifit_mobile/core/errors/failure.dart';
import 'package:sahbifit_mobile/core/utils/type_defs.dart';
import 'package:sahbifit_mobile/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:sahbifit_mobile/features/chat/data/models/message_model.dart';
import 'package:sahbifit_mobile/features/chat/domain/entities/message.dart';
import 'package:sahbifit_mobile/features/chat/domain/repositories/chat_repository.dart';
import 'package:sahbifit_mobile/features/user/domain/entities/user.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource);

  @override
  ResultStream<List<Message>> getChatStream(String sessionId) {
    try {
      return remoteDataSource.getChatStream(sessionId).map((models) {
        final messages = models.map((model) => model.toDomain()).toList();
        return Right(messages);
      }).handleError((error) {
        return Left(ServerFailure('Failed to load messages: $error'));
      });
    } catch (e) {
      // This will catch synchronous errors, e.g., if Firestore is not initialized
      return Stream.value(Left(ServerFailure(e.toString())));
    }
  }

  @override
  Future<Result<void>> sendMessage({
    required String sessionId,
    required String text,
    required User sender, // Get the current user from the BLoC/Cubit
  }) async {
    try {
      final createMessageModel = CreateMessageModel(
        senderId: sender.userId, // Ensure your User entity has this
        senderName: sender.firstName, // Or fullName
        text: text,
      );
      await remoteDataSource.sendMessage(sessionId, createMessageModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}