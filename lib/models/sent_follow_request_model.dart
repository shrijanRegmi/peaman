import 'package:peaman/models/id_user_model.dart';

class PeamanSentFollowRequest extends IdUser {
  PeamanSentFollowRequest({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          uid: uid,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanSentFollowRequest fromJson(final Map<String, dynamic> data) {
    return PeamanSentFollowRequest(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
