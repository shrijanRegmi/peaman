import 'package:peaman/models/id_user_model.dart';

class PeamanFollowing extends IdUser {
  PeamanFollowing({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          uid: uid,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanFollowing fromJson(final Map<String, dynamic> data) {
    return PeamanFollowing(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
