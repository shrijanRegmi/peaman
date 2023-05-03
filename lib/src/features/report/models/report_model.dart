import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman/peaman.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

@freezed
class PeamanReport with _$PeamanReport {
  const factory PeamanReport({
    final String? id,
    @Default(PeamanReportType.unknown) final PeamanReportType type,
    @Default(<PeamanReportedBy>[]) reportedBys,
    @Default(0) final int reportsCount,
    final int? createdAt,
    final int? updatedAt,
  }) = _PeamanReport;

  factory PeamanReport.fromJson(Map<String, dynamic> json) =>
      _$PeamanReportFromJson(json);
}
