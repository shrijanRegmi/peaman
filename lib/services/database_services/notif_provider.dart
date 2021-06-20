import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peaman/models/follow_request_model.dart';
import 'package:peaman/models/notification_model.dart';
import 'package:peaman/models/user_model.dart';

class NotificationProvider {
  final BuildContext? context;
  final PeamanUser? appUser;
  final PeamanNotification? notification;
  NotificationProvider({
    this.context,
    this.appUser,
    this.notification,
  });

  final _ref = FirebaseFirestore.instance;

  Future readNotification() async {
    try {
      final _notifRef = appUser?.appUserRef
          ?.collection('notifications')
          .doc(notification?.id);
      await _notifRef?.update({
        'is_read': true,
      });
      print('Success: Reading notification ${notification?.id}');
      return 'Success';
    } catch (e) {
      print(e);
      print('Error!!!: Reading notification ${notification?.id}');
      return null;
    }
  }

  // get notification from firebase
  List<PeamanNotification> notificationFromFirebase(
      QuerySnapshot<Map<String, dynamic>> colSnap) {
    return colSnap.docs
        .map((doc) => PeamanNotification.fromJson(doc.data(), doc.id))
        .toList();
  }

  // get follow requests from firebase
  List<PeamanFollowRequest> followRequestsFromFirebase(
      QuerySnapshot<Map<String, dynamic>> colSnap) {
    return colSnap.docs
        .map((doc) => PeamanFollowRequest.fromJson(doc.data(), doc.id))
        .toList();
  }

  // stream of notifications
  Stream<List<PeamanNotification>> get notificationsList {
    return _ref
        .collection('users')
        .doc(appUser?.uid)
        .collection('notifications')
        .orderBy('updated_at', descending: true)
        .snapshots()
        .map(notificationFromFirebase);
  }

  // stream of follow requests
  Stream<List<PeamanFollowRequest>> get followRequests {
    return _ref
        .collection('users')
        .doc(appUser?.uid)
        .collection('follow_requests')
        .limit(10)
        .orderBy('updated_at', descending: true)
        .snapshots()
        .map(followRequestsFromFirebase);
  }
}
