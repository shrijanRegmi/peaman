class PeamanFollowRequest {
  final String? uid;
  final int? createdAt;
  final int? updatedAt;

  PeamanFollowRequest({
    this.uid,
    this.createdAt,
    this.updatedAt,
  });

  static PeamanFollowRequest fromJson(final Map<String, dynamic> data) {
    return PeamanFollowRequest(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
