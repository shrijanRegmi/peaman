import 'package:peaman/peaman.dart';
import 'package:peaman/services/database_services/message_provider.dart';

class PChatProvider {
  static Future<void> sendMessage({
    required final String chatId,
    required final PeamanMessage message,
  }) async {
    await MessageProvider(
      appUserId: message.senderId,
      chatId: chatId,
    ).sendMessage(message: message);
  }

  static Future<void> readMessage({
    required final String chatId,
    required final PeamanChatUser chatUser,
  }) async {
    await MessageProvider(chatId: chatId).readChatMessage(chatUser);
  }

  static Future<void> setTyping({
    required final String chatId,
    required final PeamanChatUser chatUser,
    required final PeamanTypingState typingState,
  }) async {
    await MessageProvider(chatId: chatId).setTyping(chatUser, typingState);
  }

  static Future<void> updateChat({
    required final String chatId,
    required final Map<String, dynamic> data,
  }) async {
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

  static Stream<List<PeamanMessage>> getMessages({
    required final String chatId,
    final int limit = 10,
  }) {
    return MessageProvider(chatId: chatId, limit: limit).messagesList;
  }

  static Stream<List<PeamanChat>> getChats({
    required final String uid,
  }) {
    return MessageProvider(appUserId: uid).chatList;
  }

  static Stream<List<PeamanIdleChat>> getIdleChats({
    required final String uid,
  }) {
    return MessageProvider(appUserId: uid).idleChatsList;
  }

  static Stream<List<PeamanAcceptedChat>> getAcceptedChats({
    required final String uid,
  }) {
    return MessageProvider(appUserId: uid).acceptedChatsList;
  }

  static Stream<List<PeamanDeclinedChat>> getDeclinedChats({
    required final String uid,
  }) {
    return MessageProvider(appUserId: uid).declinedChatsList;
  }

  static Stream<PeamanMessage> getSingleMessageById({
    required final String chatId,
    required final String messageId,
  }) {
    return MessageProvider(chatId: chatId).message(messageId);
  }
}
