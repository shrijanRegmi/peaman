// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanFeed _$$_PeamanFeedFromJson(Map<String, dynamic> json) =>
    _$_PeamanFeed(
      id: json['id'] as String?,
      ownerId: json['owner_id'] as String?,
      caption: json['caption'] as String?,
      files: (json['files'] as List<dynamic>?)
              ?.map((e) => PeamanFileUrl.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PeamanFileUrl>[],
      type: $enumDecodeNullable(_$PeamanFeedTypeEnumMap, json['type']) ??
          PeamanFeedType.text,
      reactionsCount: json['reactions_count'] as int? ?? 0,
      commentsCount: json['comments_count'] as int? ?? 0,
      repliesCount: json['replies_count'] as int? ?? 0,
      savesCount: json['saves_count'] as int? ?? 0,
      sharesCount: json['shares_count'] as int? ?? 0,
      viewsCount: json['views_count'] as int? ?? 0,
      ytLink: json['yt_link'] as String?,
      pollQuestion: json['poll_question'] as String?,
      pollOptions: (json['poll_options'] as List<dynamic>?)
              ?.map((e) => PeamanPollOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PeamanPollOption>[],
      featured: json['featured'] as bool? ?? false,
      searchKeys: (json['search_keys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      createdAt: json['created_at'] as int?,
      updatedAt: json['updated_at'] as int?,
      visibility: json['visibility'] as bool? ?? true,
    );

Map<String, dynamic> _$$_PeamanFeedToJson(_$_PeamanFeed instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('caption', instance.caption);
  val['files'] = instance.files.map((e) => e.toJson()).toList();
  val['type'] = _$PeamanFeedTypeEnumMap[instance.type]!;
  val['reactions_count'] = instance.reactionsCount;
  val['comments_count'] = instance.commentsCount;
  val['replies_count'] = instance.repliesCount;
  val['saves_count'] = instance.savesCount;
  val['shares_count'] = instance.sharesCount;
  val['views_count'] = instance.viewsCount;
  writeNotNull('yt_link', instance.ytLink);
  writeNotNull('poll_question', instance.pollQuestion);
  val['poll_options'] = instance.pollOptions.map((e) => e.toJson()).toList();
  val['featured'] = instance.featured;
  val['search_keys'] = instance.searchKeys;
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  val['visibility'] = instance.visibility;
  return val;
}

const _$PeamanFeedTypeEnumMap = {
  PeamanFeedType.unknown: 'unknown',
  PeamanFeedType.text: 'text',
  PeamanFeedType.file: 'file',
  PeamanFeedType.poll: 'poll',
  PeamanFeedType.youTube: 'youTube',
  PeamanFeedType.other: 'other',
};
