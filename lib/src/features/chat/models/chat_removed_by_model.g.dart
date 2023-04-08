// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_removed_by_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanChatRemovedBy _$$_PeamanChatRemovedByFromJson(
        Map<String, dynamic> json) =>
    _$_PeamanChatRemovedBy(
      removedBy: json['removed_by'] as String?,
      removedAt: json['removed_at'] as int?,
    );

Map<String, dynamic> _$$_PeamanChatRemovedByToJson(
    _$_PeamanChatRemovedBy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('removed_by', instance.removedBy);
  writeNotNull('removed_at', instance.removedAt);
  return val;
}
