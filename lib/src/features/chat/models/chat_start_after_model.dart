import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_start_after_model.freezed.dart';

@freezed
class PeamanChatStartAfter with _$PeamanChatStartAfter {
  const factory PeamanChatStartAfter({
    final String? uid,
    final int? messageCreatedAt,
  }) = _PeamanChatStartAfter;
}
