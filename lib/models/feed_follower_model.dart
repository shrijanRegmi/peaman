class PeamanFeedFollower {
  final String? uid;
  final int? updatedAt;

  PeamanFeedFollower({
    this.uid,
    this.updatedAt,
  });

  static PeamanFeedFollower fromJson(final Map<String, dynamic> data) {
    return PeamanFeedFollower(
      uid: data['uid'],
      updatedAt: data['updated_at'],
    );
  }
}
