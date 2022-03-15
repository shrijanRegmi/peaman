class PeamanSavedFeed {
  final String? id;
  final int? updatedAt;

  PeamanSavedFeed({
    this.id,
    this.updatedAt,
  });

  static PeamanSavedFeed fromJson(final Map<String, dynamic> data) {
    return PeamanSavedFeed(
      id: data['id'],
      updatedAt: data['updated_at'],
    );
  }
}
