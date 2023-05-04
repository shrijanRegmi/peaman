import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/gender_type.dart';
import '../enums/online_status_type.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class PeamanUser with _$PeamanUser {
  const factory PeamanUser({
    final String? uid,
    final String? name,
    final String? userName,
    final String? email,
    final String? photo,
    final String? phone,
    final String? country,
    final String? bio,
    final String? profession,
    @Default(PeamanGender.unknown) final PeamanGender gender,
    final int? dob,
    @Default(<String>[]) final List<String> searchKeys,
    @Default(PeamanOnlineStatus.unknown) final PeamanOnlineStatus onlineStatus,
    final int? lastOnlineAt,
    @Default(0) final int feedsCount,
    @Default(0) final int photosCount,
    @Default(0) final int videosCount,
    @Default(0) final int followersCount,
    @Default(0) final int followingCount,
    @Default(0) final int reactionsReceivedFromFeedsCount,
    @Default(0) final int commentsReceivedFromFeedsCount,
    @Default(0) final int repliesReceivedFromFeedsCount,
    @Default(0) final int sharesReceivedFromFeedsCount,
    @Default(0) final int viewsReceivedFromFeedsCount,
    @Default(false) final bool isAdmin,
    @Default(false) final bool isEditor,
    @Default(false) final bool isTester,
    @Default(false) final bool isVerified,
    @Default(0) final int onboardingStep,
    @Default(false) final bool isOnboardingCompleted,
    final double? latitude,
    final double? longitude,
    final int? createdAt,
    @Default(true) final bool visibility,
    @Default(<String, dynamic>{}) final Map<String, dynamic> extraData,
  }) = _PeamanUser;

  factory PeamanUser.fromJson(final Map<String, dynamic> data) =>
      _$PeamanUserFromJson(data);
}
