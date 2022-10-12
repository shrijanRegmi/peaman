import '../peaman.dart';

class PeamanChatFile {
  final String? id;
  final List<PeamanFileUrl> urls;
  final int? createdAt;
  final int? updatedAt;

  PeamanChatFile({
    this.id,
    this.urls = const [],
    this.createdAt,
    this.updatedAt,
  });

  static PeamanChatFile fromJson(final Map<String, dynamic> data) {
    return PeamanChatFile(
      id: data['id'],
      urls: List<PeamanFileUrl>.from(
        (data['urls'] ?? []).map((e) => PeamanFileUrl.fromJson(e)),
      ),
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'urls': urls.map((e) => e.toJson()).toList(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };

    return data..removeWhere((key, value) => value == null);
  }
}
