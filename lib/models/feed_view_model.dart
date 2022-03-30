class PeamanFeedView {
  final String? ownerId;
  final int? createdAt;
  PeamanFeedView({
    this.ownerId,
    this.createdAt,
  });

  static PeamanFeedView fromJson(final Map<String, dynamic> data) {
    return PeamanFeedView(
      ownerId: data['owner_id'],
      createdAt: data['updated_at'],
    );
  }
}
