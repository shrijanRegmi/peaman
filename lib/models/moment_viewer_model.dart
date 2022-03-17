class PeamanMomentViewer {
  final String? uid;
  final int? updatedAt;

  PeamanMomentViewer({
    this.uid,
    this.updatedAt,
  });

  static PeamanMomentViewer fromJson(final Map<String, dynamic> data) {
    return PeamanMomentViewer(
      uid: data['uid'],
      updatedAt: data['updated_at'],
    );
  }
}
