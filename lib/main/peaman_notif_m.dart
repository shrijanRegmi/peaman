import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:peaman/models/follow_request_notification_model.dart';
import 'package:peaman/models/notification_model.dart';
import 'package:peaman/models/user_model.dart';
import 'package:peaman/services/database_services/notif_provider.dart';

import '../services/messaging_services/firebase_messaging_provider.dart';

class PNotificationProvider {
  static final _auth = FirebaseAuth.instance;
  static final _uid = _auth.currentUser?.uid;

  static Future<void> initializePushNotification({required final String uid}) {
    return FirebaseMessagingProvider.initialize(uid: uid);
  }

  static Future<void> resetPushNotification({required final String uid}) {
    return FirebaseMessagingProvider.reset(uid: uid);
  }

  static Future<void> onReceivedPushNotification({
    required final Future<void> Function(RemoteMessage) onPushNotification,
  }) {
    return FirebaseMessagingProvider.onReceivedMessage(
      onMessage: onPushNotification,
    );
  }

  static Future<void> readNotification(
    final String notificationId,
  ) {
    return NotificationProvider(
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
