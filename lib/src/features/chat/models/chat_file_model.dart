import 'package:freezed_annotation/freezed_annotation.dart';

import '../../shared/models/file_url_model.dart';

part 'chat_file_model.freezed.dart';
part 'chat_file_model.g.dart';

@freezed
class PeamanChatFile with _$PeamanChatFile {
  const factory PeamanChatFile({
    final String? id,
    @Default(<PeamanFileUrl>[]) final List<PeamanFileUrl> urls,
    final int? createdAt,
    final int? updatedAt,
  }) = _PeamanChatFile;

  factory PeamanChatFile.fromJson(final Map<String, dynamic> json) =>
      _$PeamanChatFileFromJson(json);
}
