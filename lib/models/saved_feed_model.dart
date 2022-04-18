class PeamanSavedFeed {
  final String? id;
  final int? createdAt;
  final int? updatedAt;

  PeamanSavedFeed({
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  static PeamanSavedFeed fromJson(final Map<String, dynamic> data) {
    return PeamanSavedFeed(
      id: data['id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
