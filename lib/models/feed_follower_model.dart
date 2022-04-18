class PeamanFeedFollower {
  final String? uid;
  final int? createdAt;
  final int? updatedAt;

  PeamanFeedFollower({
    this.uid,
    this.createdAt,
    this.updatedAt,
  });

  static PeamanFeedFollower fromJson(final Map<String, dynamic> data) {
    return PeamanFeedFollower(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
