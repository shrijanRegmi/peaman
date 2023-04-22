import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/file_type.dart';

part 'file_url_model.freezed.dart';
part 'file_url_model.g.dart';

@freezed
class PeamanFileUrl with _$PeamanFileUrl {
  const factory PeamanFileUrl({
    final String? url,
    final String? thumbnailUrl,
    @Default(PeamanFileType.unknown) final PeamanFileType type,
  }) = _PeamanChatFileUrl;

  factory PeamanFileUrl.fromJson(final Map<String, dynamic> data) =>
      _$PeamanFileUrlFromJson(data);
}
