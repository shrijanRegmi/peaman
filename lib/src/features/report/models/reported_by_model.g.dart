// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reported_by_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanReportedBy _$$_PeamanReportedByFromJson(Map<String, dynamic> json) =>
    _$_PeamanReportedBy(
      uid: json['uid'] as String,
      reason: json['reason'] as String,
      createdAt: json['created_at'] as int?,
      updatedAt: json['updated_at'] as int?,
    );

Map<String, dynamic> _$$_PeamanReportedByToJson(_$_PeamanReportedBy instance) {
  final val = <String, dynamic>{
    'uid': instance.uid,
    'reason': instance.reason,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  return val;
}
