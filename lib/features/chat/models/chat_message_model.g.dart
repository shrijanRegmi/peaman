// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanChatMessage _$$_PeamanChatMessageFromJson(Map<String, dynamic> json) =>
    _$_PeamanChatMessage(
      id: json['id'] as String?,
      chatId: json['chatId'] as String?,
      text: json['text'] as String?,
      files: (json['files'] as List<dynamic>?)
              ?.map(
                  (e) => PeamanChatFileUrl.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PeamanChatFileUrl>[],
      type: $enumDecodeNullable(_$PeamanChatMessageTypeEnumMap, json['type']) ??
          PeamanChatMessageType.text,
      senderId: json['senderId'] as String?,
      senderName: json['senderName'] as String?,
      receiverIds: (json['receiverIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      extraId: json['extraId'] as String?,
      parentId: json['parentId'] as String?,
      parentText: json['parentText'] as String?,
      parentFiles: (json['parentFiles'] as List<dynamic>?)
              ?.map(
                  (e) => PeamanChatFileUrl.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PeamanChatFileUrl>[],
      visibility: json['visibility'] as bool? ?? true,
      isForwarded: json['isForwarded'] as bool? ?? false,
      forwardedFromChatId: json['forwardedFromChatId'] as String?,
      createdAt: json['createdAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
      extraData: json['extraData'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$_PeamanChatMessageToJson(
        _$_PeamanChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chatId': instance.chatId,
      'text': instance.text,
      'files': instance.files,
      'type': _$PeamanChatMessageTypeEnumMap[instance.type]!,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'receiverIds': instance.receiverIds,
      'extraId': instance.extraId,
      'parentId': instance.parentId,
      'parentText': instance.parentText,
      'parentFiles': instance.parentFiles,
      'visibility': instance.visibility,
      'isForwarded': instance.isForwarded,
      'forwardedFromChatId': instance.forwardedFromChatId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'extraData': instance.extraData,
    };

const _$PeamanChatMessageTypeEnumMap = {
  PeamanChatMessageType.unknown: 'unknown',
  PeamanChatMessageType.text: 'text',
  PeamanChatMessageType.file: 'file',
  PeamanChatMessageType.storyReply: 'storyReply',
  PeamanChatMessageType.feedShare: 'feedShare',
};
