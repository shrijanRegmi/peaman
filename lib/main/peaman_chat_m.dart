import 'package:peaman/peaman.dart';
import 'package:peaman/services/database_services/message_provider.dart';

class PChatProvider {
  static Future<void> sendMessage({
    required final PeamanMessage message,
    final Function(PeamanMessage)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    await MessageProvider().sendMessage(
      message: message,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> readMessage({
    required final String chatId,
    required final PeamanChatUser chatUser,
  }) async {
    await MessageProvider().readChatMessage(
      chatId: chatId,
      chatUser: chatUser,
    );
  }

  static Future<void> setTyping({
    required final String chatId,
    required final PeamanChatUser chatUser,
    required final PeamanTypingState typingState,
  }) async {
    await MessageProvider().setTyping(
      chatId: chatId,
      chatUser: chatUser,
      typingState: typingState,
    );
  }

  static Future<void> updateChat({
    required final String chatId,
    required final Map<String, dynamic> data,
  }) async {
    await MessageProvider().updateChatData(chatId: chatId, data: data);
  }

  static Future<void> acceptRequest({
    required final String chatId,
    final Function(PeamanChatRequestStatus)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    await MessageProvider().acceptChatRequest(
      chatId: chatId,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> declineRequest({
    required final String chatId,
    final Function(PeamanChatRequestStatus)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    await MessageProvider().declineChatRequest(
      chatId: chatId,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Stream<List<PeamanMessage>> getMessages({
    required final String chatId,
    final int limit = 10,
  }) {
    return MessageProvider().messagesList(
      chatId: chatId,
      limit: limit,
    );
  }

  static Stream<List<PeamanChat>> getChats({
    required final String uid,
  }) {
    return MessageProvider().chatList(uid: uid);
  }

  static Stream<List<PeamanIdleChat>> getIdleChats({
    required final String uid,
  }) {
    return MessageProvider().idleChatsList(uid: uid);
  }

  static Stream<List<PeamanAcceptedChat>> getAcceptedChats({
    required final String uid,
  }) {
    return MessageProvider().acceptedChatsList(uid: uid);
  }

  static Stream<List<PeamanDeclinedChat>> getDeclinedChats({
    required final String uid,
  }) {
    return MessageProvider().declinedChatsList(uid: uid);
  }

  static Stream<PeamanMessage> getSingleMessageById({
    required final String chatId,
    required final String messageId,
  }) {
    return MessageProvider().message(chatId: chatId, messageId: messageId);
  }
}
