import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/chat_request_status.dart';
import 'chat_sent_messages_count_model.dart';
import 'chat_start_after_model.dart';
import 'chat_unread_messages_count_model.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class PeamanChat with _$PeamanChat {
  const factory PeamanChat({
    final String? id,
    final String? lastMessageId,
    @Default(<String>[]) final List<String> userIds,
    @Default(<String>[]) final List<String> hiddenToUserIds,
    @Default(<String>[]) final List<String> archivedByUserIds,
    @Default(<String>[]) final List<String> typingUserIds,
    @Default(<String>[]) final List<String> pinnedChatUserIds,
    @Default(PeamanChatRequestStatus.idle)
        final PeamanChatRequestStatus chatRequestStatus,
    final String? chatRequestSenderId,
    @Default(0) final int totalSentMessages,
    @JsonKey(ignore: true)
    @Default(<PeamanChatSentMessage>[])
        final List<PeamanChatSentMessage> sentMessages,
    @JsonKey(ignore: true)
    @Default(<PeamanChatUnreadMessage>[])
        final List<PeamanChatUnreadMessage> unreadMessages,
    @JsonKey(ignore: true)
    @Default(<PeamanChatStartAfter>[])
        final List<PeamanChatStartAfter> startAfters,
    @Default(true) final bool visibility,
    final int? createdAt,
    final int? updatedAt,
    @Default(<String, dynamic>{}) final Map<String, dynamic> extraData,
  }) = _PeamanChat;

  factory PeamanChat.fromJson(Map<String, dynamic> data) =>
      _$PeamanChatFromJson(data).copyWith(
        sentMessages: _ListGenerator.getSentMessagesCountByUid(data),
        unreadMessages: _ListGenerator.getUnreadMessagesCountByUid(data),
        startAfters: _ListGenerator.getStartAftersByUid(data),
      );
}

class _ListGenerator {
  static List<PeamanChatUnreadMessage> getUnreadMessagesCountByUid(
    final Map<String, dynamic> data,
  ) {
    final list = <PeamanChatUnreadMessage>[];
    data.forEach((key, value) {
      if (key.startsWith('z') && key.endsWith('unread_messages')) {
        final uid = key.split('_')[1];
        final count = (data[key] ?? 0) as int;

        final unreadMessage = PeamanChatUnreadMessage(
          uid: uid,
          unreadMessagesCount: count,
        );

        list.add(unreadMessage);
      }
    });
    return list;
  }

  static List<PeamanChatSentMessage> getSentMessagesCountByUid(
    final Map<String, dynamic> data,
  ) {
    final list = <PeamanChatSentMessage>[];
    data.forEach((key, value) {
      if (key.startsWith('z') && key.endsWith('sent_messages')) {
        final uid = key.split('_')[1];
        final count = (data[key] ?? 0) as int;

        final unreadMessage = PeamanChatSentMessage(
          uid: uid,
          sentMessagesCount: count,
        );

        list.add(unreadMessage);
      }
    });
    return list;
  }

  static List<PeamanChatStartAfter> getStartAftersByUid(
    final Map<String, dynamic> data,
  ) {
    final list = <PeamanChatStartAfter>[];
    data.forEach((key, value) {
      if (key.startsWith('z') && key.endsWith('start_after')) {
        final uid = key.split('_')[1];
        final value = (data[key] ?? 0) as int;

        final startAfter = PeamanChatStartAfter(
          uid: uid,
          messageCreatedAt: value,
        );

        list.add(startAfter);
      }
    });
    return list;
  }
}
