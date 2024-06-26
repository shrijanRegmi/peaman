// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanChat _$$_PeamanChatFromJson(Map<String, dynamic> json) =>
    _$_PeamanChat(
      id: json['id'] as String?,
      type: $enumDecodeNullable(_$PeamanChatTypeEnumMap, json['type']) ??
          PeamanChatType.oneToOne,
      title: json['title'] as String?,
      lastMessageId: json['last_message_id'] as String?,
      lastMessageCreatedAt: json['last_message_created_at'] as int?,
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
      adminId: json['admin_id'] as String?,
      totalSentMessages: json['total_sent_messages'] as int? ?? 0,
      visibility: json['visibility'] as bool? ?? true,
      createdAt: json['created_at'] as int?,
      updatedAt: json['updated_at'] as int?,
    );

Map<String, dynamic> _$$_PeamanChatToJson(_$_PeamanChat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['type'] = _$PeamanChatTypeEnumMap[instance.type]!;
  writeNotNull('title', instance.title);
  writeNotNull('last_message_id', instance.lastMessageId);
  writeNotNull('last_message_created_at', instance.lastMessageCreatedAt);
  val['user_ids'] = instance.userIds;
  val['hidden_to_user_ids'] = instance.hiddenToUserIds;
  val['archived_by_user_ids'] = instance.archivedByUserIds;
  val['typing_user_ids'] = instance.typingUserIds;
  val['pinned_chat_user_ids'] = instance.pinnedChatUserIds;
  val['chat_request_status'] =
      _$PeamanChatRequestStatusEnumMap[instance.chatRequestStatus]!;
  writeNotNull('admin_id', instance.adminId);
  val['total_sent_messages'] = instance.totalSentMessages;
  val['visibility'] = instance.visibility;
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  return val;
}

const _$PeamanChatTypeEnumMap = {
  PeamanChatType.oneToOne: 'oneToOne',
  PeamanChatType.group: 'group',
};

const _$PeamanChatRequestStatusEnumMap = {
  PeamanChatRequestStatus.idle: 'idle',
  PeamanChatRequestStatus.accepted: 'accepted',
  PeamanChatRequestStatus.declined: 'declined',
};
