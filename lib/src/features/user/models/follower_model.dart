import 'package:freezed_annotation/freezed_annotation.dart';

part 'follower_model.freezed.dart';
part 'follower_model.g.dart';

@freezed
class PeamanFollower with _$PeamanFollower {
  const factory PeamanFollower({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
  }) = _PeamanFollower;

  factory PeamanFollower.fromJson(final Map<String, dynamic> data) =>
      _$PeamanFollowerFromJson(data);
}
