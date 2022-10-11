import 'package:peaman/models/id_feed_model.dart';

class PeamanCommentedFeed extends IdFeed {
  PeamanCommentedFeed({
    final String? id,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanCommentedFeed fromJson(final Map<String, dynamic> data) {
    return PeamanCommentedFeed(
      id: data['id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
