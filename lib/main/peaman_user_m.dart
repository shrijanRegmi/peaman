import 'package:firebase_auth/firebase_auth.dart';
import 'package:peaman/enums/online_status.dart';
import 'package:peaman/models/user_model.dart';
import 'package:peaman/services/database_services/user_provider.dart';

class PUserProvider {
  static final _auth = FirebaseAuth.instance;
  static final _uid = _auth.currentUser?.uid;

  static Future<void> setUserOnlineStatus({
    required final PeamanOnlineStatus onlineStatus,
  }) async {
    return AppUserProvider(uid: _uid)
        .setUserActiveStatus(onlineStatus: onlineStatus);
  }

  static Future<void> updateUserData({
    required final Map<String, dynamic> data,
  }) async {
    return AppUserProvider(uid: _uid).updateUserDetail(data: data);
  }

  static Stream<PeamanUser> get appUser {
    return AppUserProvider(uid: _uid).appUser;
  }

  static Stream<List<PeamanUser>> getSearchedUsers(final String searchKeyword) {
    return AppUserProvider(searchKey: searchKeyword).appUserFromKey;
  }
}
