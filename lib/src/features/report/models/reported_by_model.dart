import 'package:freezed_annotation/freezed_annotation.dart';

part 'reported_by_model.freezed.dart';
part 'reported_by_model.g.dart';

@freezed
class PeamanReportedBy with _$PeamanReportedBy {
  const factory PeamanReportedBy({
    required final String uid,
    required final String reason,
    final int? createdAt,
    final int? updatedAt,
  }) = _PeamanReportedBy;

  factory PeamanReportedBy.fromJson(Map<String, dynamic> json) =>
      _$PeamanReportedByFromJson(json);
}
