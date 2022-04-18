class PeamanFeedViewer {
  final String? uid;
  final int? createdAt;
  final int? updatedAt;

  PeamanFeedViewer({
    this.uid,
    this.createdAt,
    this.updatedAt,
  });

  static PeamanFeedViewer fromJson(final Map<String, dynamic> data) {
    return PeamanFeedViewer(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
