import 'package:peaman/peaman.dart';
import 'package:peaman/services/database_services/message_provider.dart';

import '../helpers/common_helper.dart';
import '../utils/query_type_def.dart';

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

  static Stream<List<PeamanChat>> getChats({
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'chats');
    return MessageProvider().getChats(query: query);
  }

  static Stream<List<PeamanChat>> getUserChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userChats');
    return MessageProvider().getUserChats(
      uid: uid,
      query: query,
    );
  }

  static Stream<List<PeamanIdleChat>> getUserIdleChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userIdleChats');
    return MessageProvider().getUserIdleChats(
      uid: uid,
      query: query,
    );
  }

  static Stream<List<PeamanAcceptedChat>> getUserAcceptedChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userAcceptedChats');
    return MessageProvider().getUserAcceptedChats(
      uid: uid,
      query: query,
    );
  }

  static Stream<List<PeamanDeclinedChat>> getUserDeclinedChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userDeclinedChats');
    return MessageProvider().getUserDeclinedChats(
      uid: uid,
      query: query,
    );
  }

  static Stream<List<PeamanMessage>> getMessages({
    required final String chatId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'messages');
    return MessageProvider().getMessages(
      chatId: chatId,
      query: query,
    );
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
