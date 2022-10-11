class IdUser {
  final String? uid;
  final int? createdAt;
  final int? updatedAt;

  IdUser({
    required this.uid,
    required this.createdAt,
    required this.updatedAt,
  });

  static IdUser fromJson(final Map<String, dynamic> data) {
    return IdUser(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'uid': uid,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };

    return data..removeWhere((key, value) => value == null);
  }
}
