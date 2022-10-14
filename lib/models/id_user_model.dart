class IdUser {
  final String? uid;
  final int? createdAt;
  final int? updatedAt;
  final Map<String, dynamic> extraData;

  IdUser({
    required this.uid,
    required this.createdAt,
    required this.updatedAt,
    this.extraData = const <String, dynamic>{},
  });

  static IdUser fromJson(final Map<String, dynamic> data) {
    return IdUser(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'uid': uid,
      'created_at': createdAt,
      'updated_at': updatedAt,
      ...extraData,
    };

    return data..removeWhere((key, value) => value == null);
  }
}
