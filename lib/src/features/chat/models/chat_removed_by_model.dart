import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_removed_by_model.g.dart';
part 'chat_removed_by_model.freezed.dart';

@freezed
class PeamanChatRemovedBy with _$PeamanChatRemovedBy {
  const factory PeamanChatRemovedBy({
    @JsonKey(ignore: true) final String? uid,
    final String? removedBy,
    final int? removedAt,
  }) = _PeamanChatRemovedBy;

  factory PeamanChatRemovedBy.fromJson(final Map<String, dynamic> data) =>
      _$PeamanChatRemovedByFromJson(data);
}
