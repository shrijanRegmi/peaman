import 'package:peaman/peaman.dart';

class PeamanMoment {
  final String? id;
  final String? ownerId;
  final List<PeamanMomentPicture> pictures;
  final int? expiresAt;
  final int? views;
  final int? createdAt;
  final int? updatedAt;
  final Map<String, dynamic> extraData;

  PeamanMoment({
    this.id,
    this.ownerId,
    this.pictures = const <PeamanMomentPicture>[],
    this.views = 0,
    this.expiresAt,
    this.createdAt,
    this.updatedAt,
    this.extraData = const {},
  });

  PeamanMoment copyWith({
    final String? id,
    final String? ownerId,
    final List<PeamanMomentPicture>? pictures,
    final int? views,
    final int? expiresAt,
    final int? createdAt,
    final int? updatedAt,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanMoment(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      pictures: pictures ?? this.pictures,
      views: views ?? this.views,
      expiresAt: expiresAt ?? this.expiresAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanMoment fromJson(final Map<String, dynamic> data) {
    return PeamanMoment(
      id: data['id'],
      ownerId: data['owner_id'],
      pictures: List<Map<String, dynamic>>.from((data['pictures'] ?? []))
          .map((e) => PeamanMomentPicture.fromJson(e))
          .toList(),
      views: data['views'] ?? 0,
      expiresAt: data['expires_at'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    final _data = {
      'id': id,
      'pictures': pictures.map((e) => e.toJson()).toList(),
      'owner_id': ownerId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'expires_at': expiresAt,
      ...extraData,
    };

    _data.removeWhere((key, value) => value == null);
    return _data;
  }
}
