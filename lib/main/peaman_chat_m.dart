import 'package:peaman/peaman.dart';

import '../services/database_services/message_provider.dart';

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

  static Future<void> deleteChat({
    required String uid,
    required String chatId,
    required int lastMessageCreatedAt,
  }) async {
    await MessageProvider().deleteChat(
      uid: uid,
      chatId: chatId,
      lastMessageCreatedAt: lastMessageCreatedAt,
    );
  }

  Future<void> deleteChatMessage({
    required String chatId,
    required String messageId,
  }) async {
    await MessageProvider().deleteChatMessage(
      chatId: chatId,
      messageId: messageId,
    );
  }

  Future<void> unsendChatMessage({
    required String chatId,
    required String messageId,
  }) async {
    await MessageProvider().unsendChatMessage(
      chatId: chatId,
      messageId: messageId,
    );
  }

  static Future<void> readMessage({
    required final String chatId,
    required final String uid,
  }) async {
    await MessageProvider().readChatMessage(
      chatId: chatId,
      uid: uid,
    );
  }

  static Future<void> setTypingStatus({
    required final String chatId,
    required final String uid,
    required final PeamanTypingStatus typingStatus,
  }) async {
    await MessageProvider().setTypingStatus(
      chatId: chatId,
      uid: uid,
      typingStatus: typingStatus,
    );
  }

  static Future<void> updateChat({
    required final String chatId,
    final PeamanChatUpdater? updater,
    final PeamanChatPartialUpdater? positivePartialUpdater,
    final PeamanChatPartialUpdater? negativePartialUpdater,
  }) async {
    await MessageProvider().updateChatData(
      chatId: chatId,
      updater: updater,
      positivePartialUpdater: positivePartialUpdater,
      negativePartialUpdater: negativePartialUpdater,
    );
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

  static Future<List<PeamanChat>> getChats({
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'chats');
    return MessageProvider().getChats(query: query);
  }

  static Stream<List<PeamanChat>> getChatsStream({
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'chats');
    return MessageProvider().getChatsStream(query: query);
  }

  static Future<List<PeamanChat>> getUserChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userChats');
    return MessageProvider().getUserChats(
      uid: uid,
      query: query,
    );
  }

  static Stream<List<PeamanChat>> getUserChatsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userChats');
    return MessageProvider().getUserChatsStream(
      uid: uid,
      query: query,
    );
  }

  static Future<List<PeamanIdleChat>> getUserIdleChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userIdleChats');
    return MessageProvider().getUserIdleChats(
      uid: uid,
      query: query,
    );
  }

  static Stream<List<PeamanIdleChat>> getUserIdleChatsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userIdleChats');
    return MessageProvider().getUserIdleChatsStream(
      uid: uid,
      query: query,
    );
  }

  static Future<List<PeamanAcceptedChat>> getUserAcceptedChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userAcceptedChats');
    return MessageProvider().getUserAcceptedChats(
      uid: uid,
      query: query,
    );
  }

  static Stream<List<PeamanAcceptedChat>> getUserAcceptedChatsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userAcceptedChats');
    return MessageProvider().getUserAcceptedChatsStream(
      uid: uid,
      query: query,
    );
  }

  static Future<List<PeamanDeclinedChat>> getUserDeclinedChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userDeclinedChats');
    return MessageProvider().getUserDeclinedChats(
      uid: uid,
      query: query,
    );
  }

  static Stream<List<PeamanDeclinedChat>> getUserDeclinedChatsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userDeclinedChats');
    return MessageProvider().getUserDeclinedChatsStream(
      uid: uid,
      query: query,
    );
  }

  static Future<List<PeamanMessage>> getMessages({
    required final String chatId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'messages');
    return MessageProvider().getMessages(
      chatId: chatId,
      query: query,
    );
  }

  static Stream<List<PeamanMessage>> getMessagesStream({
    required final String chatId,
    final int? startAfter,
  }) {
    PeamanCommonHelper.printListening(text: 'messages');
    return MessageProvider().getMessagesStream(
      chatId: chatId,
      startAfter: startAfter,
    );
  }

  static Future<PeamanMessage> getSingleMessageById({
    required final String chatId,
    required final String messageId,
  }) {
    PeamanCommonHelper.printListening(text: 'messageById');
    return MessageProvider().getSingleMessageById(
      chatId: chatId,
      messageId: messageId,
    );
  }

  static Stream<PeamanMessage> getSingleMessageByIdStream({
    required final String chatId,
    required final String messageId,
  }) {
    PeamanCommonHelper.printListening(text: 'messageById');
    return MessageProvider().getSingleMessageByIdStream(
      chatId: chatId,
      messageId: messageId,
    );
  }
}
