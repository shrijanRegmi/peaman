import 'package:freezed_annotation/freezed_annotation.dart';

part 'blocked_user_model.freezed.dart';
part 'blocked_user_model.g.dart';

@freezed
class PeamanBlockedUser with _$PeamanBlockedUser {
  const factory PeamanBlockedUser({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
    @Default(false) final bool isAccepted,
    @Default(false) final bool isIgnored,
  }) = _PeamanBlockedUser;

  factory PeamanBlockedUser.fromJson(final Map<String, dynamic> data) =>
      _$PeamanBlockedUserFromJson(data);
}
