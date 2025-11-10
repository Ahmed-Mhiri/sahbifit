import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sahbifit_mobile/features/chat/data/models/message_model.dart';

/// Abstract interface for the chat (Firestore) API.
abstract class ChatRemoteDataSource {
  /// Gets a stream of messages for a specific session.
  Stream<List<MessageModel>> getChatStream(String sessionId);

  /// Sends a new message to a session's chat.
  Future<void> sendMessage(String sessionId, CreateMessageModel message);
}

/// Implementation of [ChatRemoteDataSource] using [FirebaseFirestore].
class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final FirebaseFirestore _firestore;
  static const String _sessionCollection = 'session_chats';
  static const String _messagesSubcollection = 'messages';

  ChatRemoteDataSourceImpl(this._firestore);

  @override
  Stream<List<MessageModel>> getChatStream(String sessionId) {
    return _firestore
        .collection(_sessionCollection)
        .doc(sessionId)
        .collection(_messagesSubcollection)
        .orderBy('timestamp', descending: true) // Newest messages first
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => MessageModel.fromSnapshot(doc)).toList();
    });
  }

  @override
  Future<void> sendMessage(String sessionId, CreateMessageModel message) async {
    await _firestore
        .collection(_sessionCollection)
        .doc(sessionId)
        .collection(_messagesSubcollection)
        .add(message.toJson());
  }
}