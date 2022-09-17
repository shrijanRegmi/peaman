import '../peaman.dart';

class PeamanChatMedia {
  final String? id;
  final String? url;
  final PeamanMediaType mediaType;
  final int? createdAt;
  final int? updatedAt;

  PeamanChatMedia({
    this.id,
    this.url,
    this.mediaType = PeamanMediaType.unknown,
    this.createdAt,
    this.updatedAt,
  });

  static PeamanChatMedia fromJson(final Map<String, dynamic> data) {
    return PeamanChatMedia(
      id: data['id'],
      url: data['url'],
      mediaType: PeamanMediaType.values[data['media_type'] ?? 0],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'url': url,
      'media_type': mediaType.index,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };

    return data..removeWhere((key, value) => value == null);
  }
}
