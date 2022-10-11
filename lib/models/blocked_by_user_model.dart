import 'package:peaman/models/id_user_model.dart';

class PeamanBlockedByUser extends IdUser {
  PeamanBlockedByUser({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          uid: uid,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanBlockedByUser fromJson(final Map<String, dynamic> data) {
    return PeamanBlockedByUser(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
