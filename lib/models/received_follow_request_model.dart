import 'package:peaman/models/id_user_model.dart';

class PeamanReceivedFollowRequest extends IdUser {
  final bool accepted;

  PeamanReceivedFollowRequest({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
    this.accepted = false,
  }) : super(
          uid: uid,
          createdAt: createdAt,
          updatedAt: updatedAt,
          extraData: {'accepted': accepted},
        );

  static PeamanReceivedFollowRequest fromJson(final Map<String, dynamic> data) {
    return PeamanReceivedFollowRequest(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      accepted: data['accepted'] ?? false,
    );
  }
}
