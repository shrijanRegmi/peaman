import 'package:peaman/models/id_user_model.dart';

class PeamanFeedReplier extends IdUser {
  PeamanFeedReplier({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          uid: uid,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanFeedReplier fromJson(final Map<String, dynamic> data) {
    return PeamanFeedReplier(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
