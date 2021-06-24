import 'package:peaman/enums/chat_user.dart';
import 'package:peaman/enums/typing_state.dart';
import 'package:peaman/models/chat_model.dart';
import 'package:peaman/models/message_model.dart';
import 'package:peaman/services/database_services/message_provider.dart';

class PChatProvider {
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

  static Stream<List<PeamanMessage>> getMessages(
    final String chatId, {
    final int limit = 10,
  }) {
    return MessageProvider(chatId: chatId, limit: limit).messagesList;
  }

  static Stream<List<PeamanChat>> getChats(final String uid) {
    return MessageProvider(appUserId: uid).chatList;
  }
}
