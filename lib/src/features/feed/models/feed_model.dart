import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman/peaman.dart';

part 'feed_model.freezed.dart';
part 'feed_model.g.dart';

@freezed
class PeamanFeed with _$PeamanFeed {
  const factory PeamanFeed({
    final String? id,
    final String? ownerId,
    final String? caption,
    @Default(<PeamanFileUrl>[]) final List<PeamanFileUrl> files,
    @Default(PeamanFeedType.text) final PeamanFeedType type,
    @Default(0) final int reactionsCount,
    @Default(0) final int commentsCount,
    @Default(0) final int repliesCount,
    @Default(0) final int savesCount,
    @Default(0) final int sharesCount,
    @Default(0) final int viewsCount,
    final String? ytLink,
    final String? pollQuestion,
    @Default(<PeamanPollOption>[]) final List<PeamanPollOption> pollOptions,
    @Default(false) final bool featured,
    @Default(<String>[]) final List<String> searchKeys,
    final int? createdAt,
    final int? updatedAt,
    @Default(true) final bool visibility,
    @JsonKey(ignore: true)
    @Default(<String, dynamic>{})
        final Map<String, dynamic> extraData,
  }) = _PeamanFeed;

  factory PeamanFeed.fromJson(final Map<String, dynamic> data) =>
      _$PeamanFeedFromJson(data).copyWith(
        extraData: data,
      );
}
