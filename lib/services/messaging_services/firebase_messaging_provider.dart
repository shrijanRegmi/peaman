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
      final _androidInfo = await _deviceInfo.androidInfo;

      final _deviceRef = PeamanReferenceHelper.devicesCol(uid: uid)
          .doc(_androidInfo.androidId);

      final _token = await _firebaseMessaging.getToken();
      await _deviceRef.set({'token': _token});
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
