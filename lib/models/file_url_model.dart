import 'package:peaman/peaman.dart';

class PeamanFileUrl {
  final String? url;
  final PeamanFileType type;
  PeamanFileUrl({
    this.url,
    this.type = PeamanFileType.unknown,
  });

  static PeamanFileUrl fromJson(final Map<String, dynamic> data) {
    return PeamanFileUrl(
      url: data['url'],
      type: PeamanFileType.values[data['type'] ?? 0],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'url': url,
      'type': type.index,
    };

    return data..removeWhere((key, value) => value == null);
  }
}
