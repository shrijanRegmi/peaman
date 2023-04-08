import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_messages_cursor_model.freezed.dart';
part 'chat_messages_cursor_model.g.dart';

@freezed
class PeamanChatMessagesCursor with _$PeamanChatMessagesCursor {
  const factory PeamanChatMessagesCursor({
    @JsonKey(ignore: true) final String? uid,
    final int? startAfter,
    final int? endAt,
  }) = _PeamanChatMessagesCursor;

  factory PeamanChatMessagesCursor.fromJson(final Map<String, dynamic> data) =>
      _$PeamanChatMessagesCursorFromJson(data);
}
