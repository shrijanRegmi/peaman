import 'package:peaman/models/id_user_model.dart';

class PeamanFeedViewer extends IdUser {
  PeamanFeedViewer({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          uid: uid,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanFeedViewer fromJson(final Map<String, dynamic> data) {
    return PeamanFeedViewer(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
