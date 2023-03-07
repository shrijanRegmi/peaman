import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_feed_model.freezed.dart';
part 'sub_feed_model.g.dart';

@freezed
class PeamanSubFeed with _$PeamanSubFeed {
  const factory PeamanSubFeed({
    final String? id,
    final int? createdAt,
    final int? updatedAt,
  }) = _PeamanSubFeed;

  factory PeamanSubFeed.fromJson(final Map<String, dynamic> data) =>
      _$PeamanSubFeedFromJson(data);
}
