class PeamanFeedSaves {
  final String? uid;
  final int? createdAt;
  PeamanFeedSaves({
    this.uid,
    this.createdAt,
  });

  static PeamanFeedSaves fromJson(final Map<String, dynamic> data) {
    return PeamanFeedSaves(
      uid: data['uid'],
      createdAt: data['updated_at'],
    );
  }
}
