// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanReport _$$_PeamanReportFromJson(Map<String, dynamic> json) =>
    _$_PeamanReport(
      id: json['id'] as String?,
      type: $enumDecodeNullable(_$PeamanReportTypeEnumMap, json['type']) ??
          PeamanReportType.unknown,
      reportedBys: (json['reported_bys'] as List<dynamic>?)
              ?.map((e) => PeamanReportedBy.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PeamanReportedBy>[],
      reportsCount: json['reports_count'] as int? ?? 0,
      createdAt: json['created_at'] as int?,
      updatedAt: json['updated_at'] as int?,
    );

Map<String, dynamic> _$$_PeamanReportToJson(_$_PeamanReport instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['type'] = _$PeamanReportTypeEnumMap[instance.type]!;
  val['reported_bys'] = instance.reportedBys.map((e) => e.toJson()).toList();
  val['reports_count'] = instance.reportsCount;
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  return val;
}

const _$PeamanReportTypeEnumMap = {
  PeamanReportType.unknown: 'unknown',
  PeamanReportType.user: 'user',
  PeamanReportType.feed: 'feed',
  PeamanReportType.comment: 'comment',
  PeamanReportType.chat: 'chat',
  PeamanReportType.message: 'message',
};
