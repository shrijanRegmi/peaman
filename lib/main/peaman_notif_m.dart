import 'package:firebase_auth/firebase_auth.dart';
import 'package:peaman/models/follow_request_notification_model.dart';
import 'package:peaman/models/notification_model.dart';
import 'package:peaman/models/user_model.dart';
import 'package:peaman/services/database_services/notif_provider.dart';

class PNotificationProvider {
  static final _auth = FirebaseAuth.instance;
  static final _uid = _auth.currentUser?.uid;

  static Future readNotification(
    final String notificationId,
  ) async {
    return await NotificationProvider(
      appUser: PeamanUser(uid: _uid),
      notification: PeamanNotification(id: notificationId),
    ).readNotification();
  }

  static Stream<List<PeamanNotification>> getNotifications() {
    return NotificationProvider(
      appUser: PeamanUser(uid: _uid),
    ).notificationsList;
  }

  static Stream<List<PeamanFollowRequestNotification>> getFollowRequests(
    final PeamanUser appUser,
  ) {
    return NotificationProvider(appUser: appUser).followRequests;
  }
}
