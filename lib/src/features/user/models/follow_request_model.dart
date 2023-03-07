import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_request_model.freezed.dart';
part 'follow_request_model.g.dart';

@freezed
class PeamanFollowRequest with _$PeamanFollowRequest {
  const factory PeamanFollowRequest({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
    @Default(false) final bool isAccepted,
    @Default(false) final bool isIgnored,
  }) = _PeamanFollowRequest;

  factory PeamanFollowRequest.fromJson(final Map<String, dynamic> data) =>
      _$PeamanFollowRequestFromJson(data);
}
