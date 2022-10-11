import 'package:peaman/models/id_feed_model.dart';

class PeamanRepliedFeed extends IdFeed {
  PeamanRepliedFeed({
    final String? id,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanRepliedFeed fromJson(final Map<String, dynamic> data) {
    return PeamanRepliedFeed(
      id: data['id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
