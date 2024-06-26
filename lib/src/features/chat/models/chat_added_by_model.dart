import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_added_by_model.g.dart';
part 'chat_added_by_model.freezed.dart';

@freezed
class PeamanChatAddedBy with _$PeamanChatAddedBy {
  const factory PeamanChatAddedBy({
    @JsonKey(ignore: true) final String? uid,
    final String? addedBy,
    final int? addedAt,
  }) = _PeamanChatAddedBy;

  factory PeamanChatAddedBy.fromJson(final Map<String, dynamic> data) =>
      _$PeamanChatAddedByFromJson(data);
}
