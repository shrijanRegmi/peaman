import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_muted_until_model.freezed.dart';

@freezed
class PeamanChatMutedUntil with _$PeamanChatMutedUntil {
  const factory PeamanChatMutedUntil({
    final String? uid,
    final int? mutedUntil,
  }) = _PeamanChatMutedUsers;
}
