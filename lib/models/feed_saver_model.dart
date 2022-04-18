class PeamanFeedSaver {
  final String? uid;
  final int? createdAt;
  final int? updatedAt;

  PeamanFeedSaver({
    this.uid,
    this.updatedAt,
    this.createdAt,
  });

  static PeamanFeedSaver fromJson(final Map<String, dynamic> data) {
    return PeamanFeedSaver(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
