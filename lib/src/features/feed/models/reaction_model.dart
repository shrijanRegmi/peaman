import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/reaction_parent_type.dart';

part 'reaction_model.freezed.dart';
part 'reaction_model.g.dart';

@freezed
class PeamanReaction with _$PeamanReaction {
  const factory PeamanReaction({
    final String? id,
    final String? feedId,
    final String? ownerId,
    @Default(PeamanReactionParent.feed) final PeamanReactionParent parent,
    final String? parentId,
    final String? parentOwnerId,
    @Default(false) final bool unreacted,
    final int? createdAt,
    final int? updatedAt,
    @Default(true) final bool visibility,
    @Default(<String, dynamic>{}) final Map<String, dynamic> extraData,
  }) = _PeamanReaction;

  factory PeamanReaction.fromJson(final Map<String, dynamic> data) =>
      _$PeamanReactionFromJson(data);
}
