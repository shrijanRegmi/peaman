// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanChat _$$_PeamanChatFromJson(Map<String, dynamic> json) =>
    _$_PeamanChat(
      id: json['id'] as String?,
      lastMessageId: json['lastMessageId'] as String?,
      userIds: (json['userIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      hiddenToUserIds: (json['hiddenToUserIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      archivedByUserIds: (json['archivedByUserIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      typingUserIds: (json['typingUserIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      pinnedChatUserIds: (json['pinnedChatUserIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      chatRequestStatus: $enumDecodeNullable(
              _$PeamanChatRequestStatusEnumMap, json['chatRequestStatus']) ??
          PeamanChatRequestStatus.idle,
      chatRequestSenderId: json['chatRequestSenderId'] as String?,
      totalSentMessages: json['totalSentMessages'] as int? ?? 0,
      visibility: json['visibility'] as bool? ?? true,
      createdAt: json['createdAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
      extraData: json['extraData'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$_PeamanChatToJson(_$_PeamanChat instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastMessageId': instance.lastMessageId,
      'userIds': instance.userIds,
      'hiddenToUserIds': instance.hiddenToUserIds,
      'archivedByUserIds': instance.archivedByUserIds,
      'typingUserIds': instance.typingUserIds,
      'pinnedChatUserIds': instance.pinnedChatUserIds,
      'chatRequestStatus':
          _$PeamanChatRequestStatusEnumMap[instance.chatRequestStatus]!,
      'chatRequestSenderId': instance.chatRequestSenderId,
      'totalSentMessages': instance.totalSentMessages,
      'visibility': instance.visibility,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'extraData': instance.extraData,
    };

const _$PeamanChatRequestStatusEnumMap = {
  PeamanChatRequestStatus.idle: 'idle',
  PeamanChatRequestStatus.accepted: 'accepted',
  PeamanChatRequestStatus.declined: 'declined',
};
