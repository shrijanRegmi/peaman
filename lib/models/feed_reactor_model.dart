import 'package:peaman/models/id_user_model.dart';

class PeamanFeedReactor extends IdUser {
  PeamanFeedReactor({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          uid: uid,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanFeedReactor fromJson(final Map<String, dynamic> data) {
    return PeamanFeedReactor(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
