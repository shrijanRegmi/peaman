// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanChatMessage _$$_PeamanChatMessageFromJson(Map<String, dynamic> json) =>
    _$_PeamanChatMessage(
      id: json['id'] as String?,
      chatId: json['chat_id'] as String?,
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
        _$_PeamanChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chat_id': instance.chatId,
      'text': instance.text,
      'files': instance.files,
      'type': _$PeamanChatMessageTypeEnumMap[instance.type]!,
      'sender_id': instance.senderId,
      'sender_name': instance.senderName,
      'receiver_ids': instance.receiverIds,
      'extra_id': instance.extraId,
      'parent_id': instance.parentId,
      'parent_text': instance.parentText,
      'parent_files': instance.parentFiles,
      'visibility': instance.visibility,
      'is_forwarded': instance.isForwarded,
      'forwarded_from_chat_id': instance.forwardedFromChatId,
      'unsent': instance.unsent,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'extra_data': instance.extraData,
    };

const _$PeamanChatMessageTypeEnumMap = {
  PeamanChatMessageType.unknown: 'unknown',
  PeamanChatMessageType.text: 'text',
  PeamanChatMessageType.file: 'file',
  PeamanChatMessageType.storyReply: 'storyReply',
  PeamanChatMessageType.feedShare: 'feedShare',
};
