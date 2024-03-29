import 'package:peaman/models/id_user_model.dart';

class PeamanFeedSaver extends IdUser {
  PeamanFeedSaver({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          uid: uid,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanFeedSaver fromJson(final Map<String, dynamic> data) {
    return PeamanFeedSaver(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
