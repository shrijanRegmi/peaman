class PeamanSavedComment {
  final String? id;
  final String? feedId;
  final int? createdAt;
  final int? updatedAt;

  PeamanSavedComment({
    this.id,
    this.feedId,
    this.createdAt,
    this.updatedAt,
  });

  static PeamanSavedComment fromJson(final Map<String, dynamic> data) {
    return PeamanSavedComment(
      id: data['id'],
      feedId: data['feed_id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
