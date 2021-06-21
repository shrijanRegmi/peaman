import 'package:peaman/enums/online_status.dart';
import 'package:peaman/models/user_model.dart';
import 'package:peaman/services/database_services/user_provider.dart';

class PUserProvider {
  static Future<void> setUserOnlineStatus(
    final String uid,
    final PeamanOnlineStatus onlineStatus,
  ) async {
    return AppUserProvider(uid: uid)
        .setUserActiveStatus(onlineStatus: onlineStatus);
  }

  static Future<void> updateUserData(
    final String uid,
    final Map<String, dynamic> data,
  ) async {
    return AppUserProvider(uid: uid).updateUserDetail(data: data);
  }

  static Stream<PeamanUser> getPeamanUser(final String uid) {
    return AppUserProvider(uid: uid).appUser;
  }

  static Stream<List<PeamanUser>> getSearchedUsers(final String searchKeyword) {
    return AppUserProvider(searchKey: searchKeyword).appUserFromKey;
  }
}
