class PeamanSavedComment {
  final String? id;
  final String? feedId;
  final int? updatedAt;

  PeamanSavedComment({
    this.id,
    this.feedId,
    this.updatedAt,
  });

  static PeamanSavedComment fromJson(final Map<String, dynamic> data) {
    return PeamanSavedComment(
      id: data['id'],
      feedId: data['feed_id'],
      updatedAt: data['updated_at'],
    );
  }
}
