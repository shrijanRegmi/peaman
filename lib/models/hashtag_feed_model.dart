import 'package:peaman/models/id_feed_model.dart';

class PeamanHashtagFeed extends IdFeed {
  PeamanHashtagFeed({
    final String? id,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanHashtagFeed fromJson(final Map<String, dynamic> data) {
    return PeamanHashtagFeed(
      id: data['id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
