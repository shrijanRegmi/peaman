import 'package:peaman/peaman.dart';
import 'package:peaman/services/database_services/message_provider.dart';

import '../helpers/common_helper.dart';

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

  static Future<void> setTypingStatus({
    required final String chatId,
    required final PeamanChatUser chatUser,
    required final PeamanTypingStatus typingState,
  }) async {
    await MessageProvider().setTypingStatus(
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
  }) {
    PeamanCommonHelper.printListening(text: 'messages');
    return MessageProvider().getMessages(
      chatId: chatId,
    );
  }

  static Stream<List<PeamanChat>> getChats({
    required final String uid,
  }) {
    PeamanCommonHelper.printListening(text: 'chats');
    return MessageProvider().getChats(uid: uid);
  }

  static Stream<List<PeamanIdleChat>> getIdleChats({
    required final String uid,
  }) {
    PeamanCommonHelper.printListening(text: 'idleChats');
    return MessageProvider().getIdleChats(uid: uid);
  }

  static Stream<List<PeamanAcceptedChat>> getAcceptedChats({
    required final String uid,
  }) {
    PeamanCommonHelper.printListening(text: 'acceptedChats');
    return MessageProvider().getAcceptedChats(uid: uid);
  }

  static Stream<List<PeamanDeclinedChat>> getDeclinedChats({
    required final String uid,
  }) {
    PeamanCommonHelper.printListening(text: 'declinedChats');
    return MessageProvider().getDeclinedChats(uid: uid);
  }

  static Stream<PeamanMessage> getSingleMessageById({
    required final String chatId,
    required final String messageId,
  }) {
    PeamanCommonHelper.printListening(text: 'messageById');
    return MessageProvider().getSingleMessageById(
      chatId: chatId,
      messageId: messageId,
    );
  }
}
