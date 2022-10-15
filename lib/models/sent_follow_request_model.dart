import 'package:peaman/models/id_user_model.dart';

class PeamanSentFollowRequest extends IdUser {
  final bool accepted;
  final bool ignored;

  PeamanSentFollowRequest({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
    this.accepted = false,
    this.ignored = false,
  }) : super(
          uid: uid,
          createdAt: createdAt,
          updatedAt: updatedAt,
          extraData: {
            'accepted': accepted,
            'ignored': ignored,
          },
        );

  static PeamanSentFollowRequest fromJson(final Map<String, dynamic> data) {
    return PeamanSentFollowRequest(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      accepted: data['accepted'] ?? false,
      ignored: data['ignored'] ?? false,
    );
  }
}
