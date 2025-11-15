import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/features/chat/data/models/message_model.dart';

abstract class ChatRemoteDatasource {
  Stream<List<MessageModel>> getChatStream(String sessionId);
  Future<void> sendMessage(String sessionId, MessageModel message);
}

@Injectable(as: ChatRemoteDatasource)
class ChatRemoteDatasourceImpl implements ChatRemoteDatasource {
  final FirebaseFirestore _firestore;

  ChatRemoteDatasourceImpl(this._firestore);

  // Your backend's FirebaseChatService.java creates docs in "session_chats"
  static const String _collection = 'session_chats';
  static const String _subCollection = 'messages';

  @override
  Stream<List<MessageModel>> getChatStream(String sessionId) {
    // 1. Get the collection of messages for the given session
    final collectionRef = _firestore
        .collection(_collection)
        .doc(sessionId)
        .collection(_subCollection)
        .orderBy('timestamp', descending: true); // Order by time

    // 2. Get a stream of snapshots
    return collectionRef.snapshots().map((querySnapshot) {
      // 3. For each snapshot, map the documents into MessageModels
      return querySnapshot.docs
          .map((doc) => MessageModel.fromSnapshot(doc))
          .toList();
    });
  }

  @override
  Future<void> sendMessage(String sessionId, MessageModel message) async {
    // 1. Get the reference to the "messages" subcollection
    final collectionRef = _firestore
        .collection(_collection)
        .doc(sessionId)
        .collection(_subCollection);

    // 2. Add the new message
    // We use .toFirestore() to convert the model to a map
    // and add the server-side timestamp.
    await collectionRef.add(message.toFirestore());
  }
}
