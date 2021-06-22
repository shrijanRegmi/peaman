import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/models/user_model.dart';

class PeamanMoment {
  final String? id;
  final String? photo;
  final PeamanUser? owner;
  final String? ownerId;
  final DocumentReference? ownerRef;
  final int? updatedAt;
  final int? expiresAt;
  final bool? isSeen;
  final int? views;

  PeamanMoment({
    required this.id,
    required this.photo,
    required this.owner,
    required this.ownerId,
    required this.ownerRef,
    required this.updatedAt,
    required this.expiresAt,
    this.isSeen = false,
    this.views = 0,
  });

  PeamanMoment copyWith({
    final String? id,
    final String? photo,
    final PeamanUser? owner,
    final String? ownerId,
    final DocumentReference? ownerRef,
    final int? updatedAt,
    final bool? isSeen,
  }) {
    return PeamanMoment(
      id: id ?? this.id,
      photo: photo ?? this.photo,
      owner: owner ?? this.owner,
      ownerId: ownerId ?? this.ownerId,
      ownerRef: ownerRef ?? this.ownerRef,
      updatedAt: updatedAt ?? this.updatedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      isSeen: isSeen ?? this.isSeen,
    );
  }

  static PeamanMoment fromJson(final Map<String, dynamic> data) {
    return PeamanMoment(
      id: data['id'],
      photo: data['photo'],
      owner: PeamanUser.fromJson(data['owner']),
      ownerId: data['owner_id'],
      ownerRef: data['owner_ref'],
      updatedAt: data['updated_at'],
      expiresAt: data['expires_at'],
      views: data['views'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'photo': photo,
      'owner_id': ownerId,
      'owner_ref': ownerRef,
      'updated_at': updatedAt,
      'expires_at': updatedAt == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(updatedAt ?? 0)
              .add(Duration(minutes: 1440))
              .millisecondsSinceEpoch,
      'owner': owner?.toFeedUser(),
    };
  }
}
