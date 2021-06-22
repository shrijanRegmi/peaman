import 'package:peaman/models/follow_request_model.dart';
import 'package:peaman/models/notification_model.dart';
import 'package:peaman/models/user_model.dart';
import 'package:peaman/services/database_services/notif_provider.dart';

class PNotificationProvider {
  static Future readNotification(
    final PeamanUser appUser,
    final PeamanNotification notification,
  ) async {
    return await NotificationProvider(
      appUser: appUser,
      notification: notification,
    ).readNotification();
  }

  Stream<List<PeamanNotification>> getNotifications(
    final PeamanUser appUser,
  ) {
    return NotificationProvider(appUser: appUser).notificationsList;
  }

  Stream<List<PeamanFollowRequest>> getFollowRequests(
    final PeamanUser appUser,
  ) {
    return NotificationProvider(appUser: appUser).followRequests;
  }
}
