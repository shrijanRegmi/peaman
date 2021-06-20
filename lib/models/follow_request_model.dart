import 'package:peaman/models/user_model.dart';

class PeamanFollowRequest {
  final String? id;
  final PeamanUser? sender;
  final int? updatedAt;
  final bool? isAccepted;

  PeamanFollowRequest({
    this.id,
    this.sender,
    this.updatedAt,
    this.isAccepted,
  });

  static PeamanFollowRequest fromJson(
      final Map<String, dynamic> data, final String id) {
    return PeamanFollowRequest(
      id: id,
      sender: PeamanUser.fromJson(data['user_data']),
      updatedAt: data['updated_at'],
      isAccepted: data['is_accepted'] ?? false,
    );
  }
}
