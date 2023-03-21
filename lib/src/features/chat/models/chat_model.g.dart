// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanChat _$$_PeamanChatFromJson(Map<String, dynamic> json) =>
    _$_PeamanChat(
      id: json['id'] as String?,
      lastMessageId: json['last_message_id'] as String?,
      userIds: (json['user_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      hiddenToUserIds: (json['hidden_to_user_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      archivedByUserIds: (json['archived_by_user_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      typingUserIds: (json['typing_user_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      pinnedChatUserIds: (json['pinned_chat_user_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      chatRequestStatus: $enumDecodeNullable(
              _$PeamanChatRequestStatusEnumMap, json['chat_request_status']) ??
          PeamanChatRequestStatus.idle,
      chatRequestSenderId: json['chat_request_sender_id'] as String?,
      totalSentMessages: json['total_sent_messages'] as int? ?? 0,
      visibility: json['visibility'] as bool? ?? true,
      createdAt: json['created_at'] as int?,
      updatedAt: json['updated_at'] as int?,
      extraData: json['extra_data'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$_PeamanChatToJson(_$_PeamanChat instance) =>
    <String, dynamic>{
      'id': instance.id,
      'last_message_id': instance.lastMessageId,
      'user_ids': instance.userIds,
      'hidden_to_user_ids': instance.hiddenToUserIds,
      'archived_by_user_ids': instance.archivedByUserIds,
      'typing_user_ids': instance.typingUserIds,
      'pinned_chat_user_ids': instance.pinnedChatUserIds,
      'chat_request_status':
          _$PeamanChatRequestStatusEnumMap[instance.chatRequestStatus]!,
      'chat_request_sender_id': instance.chatRequestSenderId,
      'total_sent_messages': instance.totalSentMessages,
      'visibility': instance.visibility,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'extra_data': instance.extraData,
    };

const _$PeamanChatRequestStatusEnumMap = {
  PeamanChatRequestStatus.idle: 'idle',
  PeamanChatRequestStatus.accepted: 'accepted',
  PeamanChatRequestStatus.declined: 'declined',
};
