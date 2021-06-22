import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/models/user_model.dart';

class PeamanComment {
  final String? id;
  final PeamanUser? user;
  final DocumentReference? userRef;
  final String? comment;
  final int? updatedAt;

  PeamanComment({
    required this.id,
    required this.user,
    required this.userRef,
    required this.comment,
    required this.updatedAt,
  });

  PeamanComment copyWith({
    final String? id,
    final PeamanUser? user,
    final DocumentReference? userRef,
    final String? comment,
    final int? updatedAt,
  }) {
    return PeamanComment(
      id: id ?? this.id,
      user: user ?? this.user,
      userRef: userRef ?? this.userRef,
      comment: comment ?? this.comment,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  static PeamanComment fromJson(
      final Map<String, dynamic> data, final PeamanUser user) {
    return PeamanComment(
      id: data['id'],
      user: user,
      userRef: data['user_ref'],
      comment: data['comment'] ?? '',
      updatedAt: data['updated_at'] ?? DateTime.now().millisecondsSinceEpoch,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_ref': userRef,
      'comment': comment,
      'updated_at': updatedAt,
    };
  }
}
