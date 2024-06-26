import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/comment_parent_type.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class PeamanComment with _$PeamanComment {
  const factory PeamanComment({
    final String? id,
    final String? feedId,
    final String? ownerId,
    final String? secondUserId,
    final String? secondUserName,
    @Default(PeamanCommentParent.feed) final PeamanCommentParent parent,
    final String? parentId,
    final String? parentOwnerId,
    final String? comment,
    @Default(0) final int reactionsCount,
    @Default(0) final int repliesCount,
    final int? createdAt,
    final int? updatedAt,
    @Default(true) final bool visibility,
    @Default(<String, dynamic>{}) final Map<String, dynamic> extraData,
  }) = _PeamanComment;

  factory PeamanComment.fromJson(final Map<String, dynamic> data) =>
      _$PeamanCommentFromJson(data);
}
