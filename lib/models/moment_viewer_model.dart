import 'package:peaman/models/id_user_model.dart';

class PeamanMomentViewer extends IdUser {
  PeamanMomentViewer({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          uid: uid,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanMomentViewer fromJson(final Map<String, dynamic> data) {
    return PeamanMomentViewer(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
