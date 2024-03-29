import 'package:peaman/models/id_feed_model.dart';

class PeamanSavedFeed extends IdFeed {
  PeamanSavedFeed({
    final String? id,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanSavedFeed fromJson(final Map<String, dynamic> data) {
    return PeamanSavedFeed(
      id: data['id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
