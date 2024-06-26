import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_sent_messages_count_model.freezed.dart';

@freezed
class PeamanChatSentMessage with _$PeamanChatSentMessage {
  const factory PeamanChatSentMessage({
    final String? uid,
    @Default(0) final int sentMessagesCount,
  }) = _PeamanChatSentMessage;
}
