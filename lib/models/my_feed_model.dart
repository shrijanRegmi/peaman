import 'package:peaman/models/id_feed_model.dart';

class PeamanMyFeed extends IdFeed {
  PeamanMyFeed({
    final String? id,
    final int? createdAt,
    final int? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static PeamanMyFeed fromJson(final Map<String, dynamic> data) {
    return PeamanMyFeed(
      id: data['id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
