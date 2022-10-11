import 'package:peaman/models/id_user_model.dart';

class PeamanBlockedUser extends IdUser {
  PeamanBlockedUser({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          uid: uid,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanBlockedUser fromJson(final Map<String, dynamic> data) {
    return PeamanBlockedUser(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
