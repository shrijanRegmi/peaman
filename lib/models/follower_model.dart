import 'package:peaman/models/id_user_model.dart';

class PeamanFollower extends IdUser {
  PeamanFollower({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          uid: uid,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanFollower fromJson(final Map<String, dynamic> data) {
    return PeamanFollower(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
