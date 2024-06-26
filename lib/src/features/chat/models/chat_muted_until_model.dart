import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_muted_until_model.g.dart';
part 'chat_muted_until_model.freezed.dart';

@freezed
class PeamanChatMutedUntil with _$PeamanChatMutedUntil {
  const factory PeamanChatMutedUntil({
    @JsonKey(ignore: true) final String? uid,
    final int? mutedAt,
    final int? mutedUntil,
  }) = _PeamanChatMutedUsers;

  factory PeamanChatMutedUntil.fromJson(final Map<String, dynamic> data) =>
      _$PeamanChatMutedUntilFromJson(data);
}
