import 'package:peaman/models/user_model.dart';

class PeamanFollowRequestNotification {
  final String? id;
  final PeamanUser? sender;
  final int? updatedAt;
  final bool? isAccepted;

  PeamanFollowRequestNotification({
    required this.id,
    required this.sender,
    required this.updatedAt,
    required this.isAccepted,
  });

  static PeamanFollowRequestNotification fromJson(
      final Map<String, dynamic> data, final String id) {
    return PeamanFollowRequestNotification(
      id: id,
      sender: PeamanUser.fromJson(data['user_data']),
      updatedAt: data['updated_at'],
      isAccepted: data['is_accepted'] ?? false,
    );
  }
}
