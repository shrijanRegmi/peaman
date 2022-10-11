import 'package:peaman/models/id_feed_model.dart';

class PeamanReactedFeed extends IdFeed {
  PeamanReactedFeed({
    final String? id,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanReactedFeed fromJson(final Map<String, dynamic> data) {
    return PeamanReactedFeed(
      id: data['id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
