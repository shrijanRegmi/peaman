// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanSubFeed _$$_PeamanSubFeedFromJson(Map<String, dynamic> json) =>
    _$_PeamanSubFeed(
      id: json['id'] as String?,
      createdAt: json['created_at'] as int?,
      updatedAt: json['updated_at'] as int?,
    );

Map<String, dynamic> _$$_PeamanSubFeedToJson(_$_PeamanSubFeed instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  return val;
}
