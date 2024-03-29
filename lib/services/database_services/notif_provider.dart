import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/peaman.dart';

class NotificationProvider {
  Future<void> readNotification({
    required final String uid,
    required final String notificationId,
  }) async {
    try {
      final _notifRef = PeamanReferenceHelper.notificationsCol(
        uid: uid,
      ).doc(notificationId);

      await _notifRef.update({
        'read': true,
      });
      print('Success: Reading notification $notificationId');
    } catch (e) {
      print(e);
      print('Error!!!: Reading notification');
    }
  }

  // get notification from firebase
  List<PeamanNotification> notificationsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> colSnap,
  ) {
    return colSnap.docs
        .map((doc) => PeamanNotification.fromJson(doc.data()))
        .toList();
  }

  // future of notifications
  Future<List<PeamanNotification>> getUserNotifications({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.notificationsCol(uid: uid)
        .where('visibility', isEqualTo: true)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.get().then(notificationsFromFirebase);
  }

  // stream of notifications
  Stream<List<PeamanNotification>> getUserNotificationsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.notificationsCol(uid: uid)
        .where('visibility', isEqualTo: true)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(notificationsFromFirebase);
  }
}
