import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:sahbifit/features/chat/data/models/message_model.dart';
import 'package:sahbifit/features/chat/domain/entities/message.dart';
import 'package:sahbifit/features/chat/domain/repositories/chat_repository.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDatasource _remoteDatasource;

  ChatRepositoryImpl(this._remoteDatasource);

  @override
  Stream<List<Message>> getChatStream(String sessionId) {
    // We catch errors on the stream itself
    return _remoteDatasource.getChatStream(sessionId).map((models) {
      return models.map((model) => model.toEntity()).toList();
    }).handleError((error) {
      // Log the error and bubble up a generic failure
      print('Firestore Stream Error: $error');
      throw ServerFailure(message: 'Could not load chat messages.');
    });
  }

  @override
  Future<void> sendMessage({
    required String sessionId,
    required String senderId,
    required String text,
  }) async {
    try {
      // Create the model to send
      final message = MessageModel.forSending(
        senderId: senderId,
        text: text,
      );
      await _remoteDatasource.sendMessage(sessionId, message);
    } on FirebaseException catch (e) {
      // Handle specific Firestore errors
      throw ServerFailure(message: e.message ?? 'Failed to send message.');
    } catch (e) {
      throw ServerFailure(message: 'An unknown error occurred.');
    }
  }
}