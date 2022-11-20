import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:peaman/models/notification_model.dart';
import 'package:peaman/services/database_services/notif_provider.dart';
import '../helpers/common_helper.dart';
import '../services/messaging_services/firebase_messaging_provider.dart';
import '../utils/query_type_def.dart';

class PNotificationProvider {
  static Future<void> initializePushNotification({
    required final String uid,
  }) {
    return FirebaseMessagingProvider.initialize(uid: uid);
  }

  static Future<void> resetPushNotification({
    required final String uid,
  }) {
    return FirebaseMessagingProvider.reset(uid: uid);
  }

  static Future<void> onReceivedPushNotification({
    required final Future<void> Function(RemoteMessage) onPushNotification,
  }) {
    return FirebaseMessagingProvider.onReceivedMessage(
      onMessage: onPushNotification,
    );
  }

  static Future<void> readNotification({
    required final String uid,
    required final String notificationId,
  }) {
    return NotificationProvider().readNotification(
      uid: uid,
      notificationId: notificationId,
    );
  }

  static Future<List<PeamanNotification>> getUserNotifications({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userNotifications');
    return NotificationProvider().getUserNotifications(
      uid: uid,
      query: query,
    );
  }

  static Stream<List<PeamanNotification>> getUserNotificationsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userNotifications');
    return NotificationProvider().getUserNotificationsStream(
      uid: uid,
      query: query,
    );
  }
}
