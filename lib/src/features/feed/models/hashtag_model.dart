import 'package:freezed_annotation/freezed_annotation.dart';

part 'hashtag_model.freezed.dart';
part 'hashtag_model.g.dart';

@freezed
class PeamanHashtag with _$PeamanHashtag {
  const factory PeamanHashtag({
    final String? id,
    final String? title,
    final int? feeds,
    @Default(<String>[]) final List<String> searchKeys,
    @Default(true) final bool visibility,
    final int? createdAt,
    final int? updatedAt,
  }) = _PeamanHashtag;

  factory PeamanHashtag.fromJson(final Map<String, dynamic> data) =>
      _$PeamanHashtagFromJson(data);
}
