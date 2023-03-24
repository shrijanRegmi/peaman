// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanChatMessage _$$_PeamanChatMessageFromJson(Map<String, dynamic> json) =>
    _$_PeamanChatMessage(
      id: json['id'] as String?,
      chatId: json['chat_id'] as String?,
      chatType:
          $enumDecodeNullable(_$PeamanChatTypeEnumMap, json['chat_type']) ??
              PeamanChatType.oneToOne,
      text: json['text'] as String?,
      files: (json['files'] as List<dynamic>?)
              ?.map((e) => PeamanFileUrl.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PeamanFileUrl>[],
      type: $enumDecodeNullable(_$PeamanChatMessageTypeEnumMap, json['type']) ??
          PeamanChatMessageType.text,
      senderId: json['sender_id'] as String?,
      senderName: json['sender_name'] as String?,
      receiverIds: (json['receiver_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      extraId: json['extra_id'] as String?,
      parentId: json['parent_id'] as String?,
      parentText: json['parent_text'] as String?,
      parentFiles: (json['parent_files'] as List<dynamic>?)
              ?.map((e) => PeamanFileUrl.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PeamanFileUrl>[],
      visibility: json['visibility'] as bool? ?? true,
      isForwarded: json['is_forwarded'] as bool? ?? false,
      forwardedFromChatId: json['forwarded_from_chat_id'] as String?,
      unsent: json['unsent'] as bool? ?? false,
      createdAt: json['created_at'] as int?,
      updatedAt: json['updated_at'] as int?,
      extraData: json['extra_data'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$_PeamanChatMessageToJson(
    _$_PeamanChatMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('chat_id', instance.chatId);
  val['chat_type'] = _$PeamanChatTypeEnumMap[instance.chatType]!;
  writeNotNull('text', instance.text);
  val['files'] = instance.files;
  val['type'] = _$PeamanChatMessageTypeEnumMap[instance.type]!;
  writeNotNull('sender_id', instance.senderId);
  writeNotNull('sender_name', instance.senderName);
  val['receiver_ids'] = instance.receiverIds;
  writeNotNull('extra_id', instance.extraId);
  writeNotNull('parent_id', instance.parentId);
  writeNotNull('parent_text', instance.parentText);
  val['parent_files'] = instance.parentFiles;
  val['visibility'] = instance.visibility;
  val['is_forwarded'] = instance.isForwarded;
  writeNotNull('forwarded_from_chat_id', instance.forwardedFromChatId);
  val['unsent'] = instance.unsent;
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  val['extra_data'] = instance.extraData;
  return val;
}

const _$PeamanChatTypeEnumMap = {
  PeamanChatType.oneToOne: 'oneToOne',
  PeamanChatType.group: 'group',
};

const _$PeamanChatMessageTypeEnumMap = {
  PeamanChatMessageType.unknown: 'unknown',
  PeamanChatMessageType.text: 'text',
  PeamanChatMessageType.file: 'file',
  PeamanChatMessageType.storyReply: 'storyReply',
  PeamanChatMessageType.feedShare: 'feedShare',
};
