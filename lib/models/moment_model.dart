import 'package:peaman/peaman.dart';

class PeamanMoment {
  final String? id;
  final String? ownerId;
  final List<PeamanMomentPicture> pictures;
  final int updatedAt;
  final int expiresAt;
  final int views;
  final Map<String, dynamic> extraData;

  PeamanMoment({
    this.id,
    this.ownerId,
    this.pictures = const <PeamanMomentPicture>[],
    this.views = 0,
    this.updatedAt = -1,
    this.expiresAt = -1,
    this.extraData = const {},
  });

  PeamanMoment copyWith({
    final String? id,
    final String? ownerId,
    final List<PeamanMomentPicture>? pictures,
    final int? updatedAt,
    final int? expiresAt,
    final int? views,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanMoment(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      pictures: pictures ?? this.pictures,
      updatedAt: updatedAt ?? this.updatedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      views: views ?? this.views,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanMoment fromJson(final Map<String, dynamic> data) {
    return PeamanMoment(
      id: data['id'],
      ownerId: data['owner_id'],
      pictures: (data['pictures'] ?? [])
          .map((e) => PeamanMomentPicture.fromJson(e))
          .toList(),
      views: data['views'] ?? 0,
      updatedAt: data['updated_at'] ?? -1,
      expiresAt: data['expires_at'] ?? -1,
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    final _data = {
      'id': id,
      'pictures': pictures.map((e) => e.toJson()).toList(),
      'owner_id': ownerId,
      'updated_at': updatedAt,
      'expires_at': expiresAt,
      ...extraData,
    };

    _data.removeWhere((key, value) => value == null);
    return _data;
  }
}
