// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_messages_cursor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanChatMessagesCursor _$$_PeamanChatMessagesCursorFromJson(
        Map<String, dynamic> json) =>
    _$_PeamanChatMessagesCursor(
      startAfter: json['start_after'] as int?,
      endAt: json['end_at'] as int?,
    );

Map<String, dynamic> _$$_PeamanChatMessagesCursorToJson(
    _$_PeamanChatMessagesCursor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('start_after', instance.startAfter);
  writeNotNull('end_at', instance.endAt);
  return val;
}
