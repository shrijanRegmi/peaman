import 'package:peaman/models/id_user_model.dart';

class PeamanFeedCommenter extends IdUser {
  PeamanFeedCommenter({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          uid: uid,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanFeedCommenter fromJson(final Map<String, dynamic> data) {
    return PeamanFeedCommenter(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
