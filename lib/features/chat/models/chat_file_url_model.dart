import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/chat_file_type.dart';

part 'chat_file_url_model.freezed.dart';
part 'chat_file_url_model.g.dart';

@freezed
class PeamanChatFileUrl with _$PeamanChatFileUrl {
  const factory PeamanChatFileUrl({
    final String? url,
    @Default(PeamanChatFileType.unknown) final PeamanChatFileType type,
  }) = _PeamanChatFileUrl;

  factory PeamanChatFileUrl.fromJson(final Map<String, dynamic> data) =>
      _$PeamanChatFileUrlFromJson(data);
}
