import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:peaman/peaman.dart';

class FirebaseMessagingProvider {
  static final _firebaseMessaging = FirebaseMessaging.instance;

  // initialize and save device info of user to firestore
  static Future<void> initialize({
    required final String uid,
  }) async {
    try {
      final _deviceInfo = DeviceInfoPlugin();
      String? _docId;
      String? _platForm;

      if (Platform.isAndroid) {
        final _androidInfo = await _deviceInfo.androidInfo;

        if (_androidInfo.androidId.isNotEmpty) {
          _docId = _androidInfo.androidId;
        }
        _platForm = 'android';
      } else if (Platform.isIOS) {
        final _iosInfo = await _deviceInfo.iosInfo;

        if (_iosInfo.identifierForVendor.isNotEmpty) {
          _docId = _iosInfo.identifierForVendor;
        }
        _platForm = 'ios';
      }

      final _token = await _firebaseMessaging.getToken();
      final _deviceRef = PeamanReferenceHelper.devicesCol(uid: uid).doc(_docId);
      await _deviceRef.set({
        'id': _deviceRef.id,
        'token': _token,
        'platform': _platForm,
        'created_at': DateTime.now().millisecondsSinceEpoch,
      });

      print('Success: Initializing firebase messaging');
    } catch (e) {
      print(e);
      print('Error!!!: Initializing firebase messaging');
    }
  }

  // on recieved messages from firebase messaging service
  static Future<void> onReceivedMessage({
    required final Future<void> Function(RemoteMessage) onMessage,
  }) async {
    try {
      final _initialMessage =
          await FirebaseMessaging.instance.getInitialMessage();

      if (_initialMessage != null) {
        onMessage(_initialMessage);
      }

      FirebaseMessaging.onMessageOpenedApp.listen(onMessage);
    } catch (e) {
      print(e);
      print('Error!!!: Receiving message from notification');
    }
  }

  // reset and delete device info of user from firestore
  static Future<void> reset({
    required final String uid,
  }) async {
    try {
      final _deviceInfo = DeviceInfoPlugin();
      final _androidInfo = await _deviceInfo.androidInfo;

      final _deviceRef = PeamanReferenceHelper.devicesCol(uid: uid)
          .doc(_androidInfo.androidId);

      await _deviceRef.delete();
      print('Success: Resetting firebase messaging');
    } catch (e) {
      print(e);
      print('Error!!!: Resetting firebase messaging');
    }
  }
}
