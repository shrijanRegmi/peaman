class PeamanFeedSaves {
  final String? ownerId;
  final int? createdAt;
  PeamanFeedSaves({
    this.ownerId,
    this.createdAt,
  });

  static PeamanFeedSaves fromJson(final Map<String, dynamic> data) {
    return PeamanFeedSaves(
      ownerId: data['owner_id'],
      createdAt: data['updated_at'],
    );
  }
}
