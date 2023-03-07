import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_user_model.freezed.dart';
part 'sub_user_model.g.dart';

@freezed
class PeamanSubUser with _$PeamanSubUser {
  const factory PeamanSubUser({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
  }) = _PeamanSubUser;

  factory PeamanSubUser.fromJson(final Map<String, dynamic> data) =>
      _$PeamanSubUserFromJson(data);
}
