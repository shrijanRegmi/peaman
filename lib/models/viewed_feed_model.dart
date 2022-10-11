import 'package:peaman/models/id_feed_model.dart';

class PeamanViewedFeed extends IdFeed {
  PeamanViewedFeed({
    final String? id,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanViewedFeed fromJson(final Map<String, dynamic> data) {
    return PeamanViewedFeed(
      id: data['id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
