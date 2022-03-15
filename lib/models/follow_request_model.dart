class PeamanFollowRequest {
  final String? uid;
  final int? updatedAt;
  final bool isAccepted;

  PeamanFollowRequest({
    this.updatedAt,
    this.uid,
    this.isAccepted = false,
  });

  static PeamanFollowRequest fromJson(final Map<String, dynamic> data) {
    return PeamanFollowRequest(
      uid: data['uid'],
      updatedAt: data['updated_at'],
      isAccepted: data['is_accepted'] ?? false,
    );
  }
}
