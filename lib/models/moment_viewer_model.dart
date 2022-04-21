class PeamanMomentViewer {
  final String? uid;
  final int? createdAt;
  final int? updatedAt;

  PeamanMomentViewer({
    this.uid,
    this.createdAt,
    this.updatedAt,
  });

  static PeamanMomentViewer fromJson(final Map<String, dynamic> data) {
    return PeamanMomentViewer(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
