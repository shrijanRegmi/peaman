import 'package:peaman/models/id_feed_model.dart';

class PeamanFollowedFeed extends IdFeed {
  PeamanFollowedFeed({
    final String? id,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanFollowedFeed fromJson(final Map<String, dynamic> data) {
    return PeamanFollowedFeed(
      id: data['id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
