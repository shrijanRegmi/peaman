import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_unread_messages_count_model.freezed.dart';

@freezed
class PeamanChatUnreadMessage with _$PeamanChatUnreadMessage {
  const factory PeamanChatUnreadMessage({
    final String? uid,
    @Default(0) final int unreadMessagesCount,
  }) = _PeamanChatUnreadMessage;
}
