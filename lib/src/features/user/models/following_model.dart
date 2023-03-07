import 'package:freezed_annotation/freezed_annotation.dart';

part 'following_model.freezed.dart';
part 'following_model.g.dart';

@freezed
class PeamanFollowing with _$PeamanFollowing {
  const factory PeamanFollowing({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
  }) = _PeamanFollowing;

  factory PeamanFollowing.fromJson(final Map<String, dynamic> data) =>
      _$PeamanFollowingFromJson(data);
}
