import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/models/notification_model.dart';

class NotificationProvider {
  final _ref = FirebaseFirestore.instance;

  Future<void> readNotification({
    required final String uid,
    required final String notificationId,
  }) async {
    try {
      final _appUserRef = _ref.collection('users').doc(uid);
      final _notifRef =
          _appUserRef.collection('notifications').doc(notificationId);
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
  List<PeamanNotification> notificationFromFirebase(
    QuerySnapshot<Map<String, dynamic>> colSnap,
  ) {
    return colSnap.docs
        .map((doc) => PeamanNotification.fromJson(doc.data()))
        .toList();
  }

  // stream of notifications
  Stream<List<PeamanNotification>> notificationsList({
    required final String uid,
  }) {
    return _ref
        .collection('users')
        .doc(uid)
        .collection('notifications')
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(notificationFromFirebase);
  }
}
