import 'package:peaman/models/id_user_model.dart';

class PeamanFeedFollower extends IdUser {
  PeamanFeedFollower({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          uid: uid,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanFeedFollower fromJson(final Map<String, dynamic> data) {
    return PeamanFeedFollower(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
