import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/chat_message_type.dart';
import '../../shared/models/file_url_model.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

@freezed
class PeamanChatMessage with _$PeamanChatMessage {
  const factory PeamanChatMessage({
    final String? id,
    final String? chatId,
    final String? text,
    @Default(<PeamanFileUrl>[]) final List<PeamanFileUrl> files,
    @Default(PeamanChatMessageType.text) final PeamanChatMessageType type,
    final String? senderId,
    final String? senderName,
    @Default(<String>[]) final List<String> receiverIds,
    final String? extraId,
    final String? parentId,
    final String? parentText,
    @Default(<PeamanFileUrl>[]) final List<PeamanFileUrl> parentFiles,
    @Default(true) final bool visibility,
    @Default(false) final bool isForwarded,
    @JsonKey(ignore: true) @Default(false) final bool isTemp,
    final String? forwardedFromChatId,
    final int? createdAt,
    final int? updatedAt,
    @Default(<String, dynamic>{}) final Map<String, dynamic> extraData,
  }) = _PeamanChatMessage;

  factory PeamanChatMessage.fromJson(Map<String, dynamic> data) =>
      _$PeamanChatMessageFromJson(data);
}
