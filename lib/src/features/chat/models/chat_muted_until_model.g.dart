// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_muted_until_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanChatMutedUsers _$$_PeamanChatMutedUsersFromJson(
        Map<String, dynamic> json) =>
    _$_PeamanChatMutedUsers(
      mutedAt: json['muted_at'] as int?,
      mutedUntil: json['muted_until'] as int?,
    );

Map<String, dynamic> _$$_PeamanChatMutedUsersToJson(
    _$_PeamanChatMutedUsers instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('muted_at', instance.mutedAt);
  writeNotNull('muted_until', instance.mutedUntil);
  return val;
}
