// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_added_by_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanChatAddedBy _$$_PeamanChatAddedByFromJson(Map<String, dynamic> json) =>
    _$_PeamanChatAddedBy(
      addedBy: json['added_by'] as String?,
      addedAt: json['added_at'] as int?,
    );

Map<String, dynamic> _$$_PeamanChatAddedByToJson(
    _$_PeamanChatAddedBy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('added_by', instance.addedBy);
  writeNotNull('added_at', instance.addedAt);
  return val;
}
