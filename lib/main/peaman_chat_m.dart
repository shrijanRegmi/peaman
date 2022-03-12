import 'package:firebase_auth/firebase_auth.dart';
import 'package:peaman/peaman.dart';
import 'package:peaman/services/database_services/message_provider.dart';

class PChatProvider {
  static final _auth = FirebaseAuth.instance;

  static Future<void> sendMessage(
    final String chatId,
    final PeamanMessage message,
  ) async {
    await MessageProvider(
      appUserId: message.senderId,
      chatId: chatId,
    ).sendMessage(message: message);
  }

  static Future<void> readMessage(
    final String chatId,
    final PeamanChatUser chatUser,
  ) async {
    await MessageProvider(chatId: chatId).readChatMessage(chatUser);
  }

  static Future<void> setTyping(
    final String chatId,
    final PeamanChatUser chatUser,
    final PeamanTypingState typingState,
  ) async {
    await MessageProvider(chatId: chatId).setTyping(chatUser, typingState);
  }

  static Future<void> updateChat(
    final String chatId,
    final Map<String, dynamic> data,
  ) async {
    await MessageProvider(chatId: chatId).updateChatData(data);
  }

  static Future<void> acceptRequest({
    required final String chatId,
    final Function(PeamanChatRequestStatus)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    await MessageProvider(
      chatId: chatId,
    ).acceptChatRequest(
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> declineRequest({
    required final String chatId,
    final Function(PeamanChatRequestStatus)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    await MessageProvider(
      chatId: chatId,
    ).declineChatRequest(
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Stream<List<PeamanMessage>> getMessages(
    final String chatId, {
    final int limit = 10,
  }) {
    return MessageProvider(chatId: chatId, limit: limit).messagesList;
  }

  static Stream<List<PeamanChat>> getChats() {
    final _uid = _auth.currentUser?.uid;
    return MessageProvider(appUserId: _uid).chatList;
  }

  static Stream<List<PeamanIdleChat>> getIdleChats() {
    final _uid = _auth.currentUser?.uid;
    return MessageProvider(appUserId: _uid).idleChatsList;
  }

  static Stream<List<PeamanAcceptedChat>> getAcceptedChats() {
    final _uid = _auth.currentUser?.uid;
    return MessageProvider(appUserId: _uid).acceptedChatsList;
  }

  static Stream<List<PeamanDeclinedChat>> getDeclinedChats() {
    final _uid = _auth.currentUser?.uid;
    return MessageProvider(appUserId: _uid).declinedChatsList;
  }

  static Stream<PeamanMessage> getSingleMessageById(
    final String chatId,
    final String messageId,
  ) {
    return MessageProvider(chatId: chatId).message(messageId);
  }
}
