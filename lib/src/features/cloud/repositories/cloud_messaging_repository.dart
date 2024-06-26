import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:peaman/peaman.dart';

abstract class PeamanCloudMessagingRepository {
  Future<PeamanEither<bool, PeamanError>> initializeMessaging({
    required final String uid,
  });

  Future<PeamanEither<bool, PeamanError>> onReceivedMessage({
    required final Future<void> Function(RemoteMessage) onMessage,
  });

  Future<PeamanEither<bool, PeamanError>> resetMessaging({
    required final String uid,
  });
}

class PeamanCloudMessagingRepositoryImpl
    extends PeamanCloudMessagingRepository {
  final _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Future<PeamanEither<bool, PeamanError>> initializeMessaging({
    required String uid,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
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
        final _deviceRef = PeamanReferenceHelper.devicesCol(
          uid: uid,
        ).doc(_docId);

        await _deviceRef.set({
          'id': _deviceRef.id,
          'token': _token,
          'platform': _platForm,
          'created_at': _millis,
        });

        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<PeamanEither<bool, PeamanError>> onReceivedMessage({
    required Future<void> Function(RemoteMessage p1) onMessage,
  }) {
    return runAsyncCall(
      future: () async {
        final _initialMessage = await _firebaseMessaging.getInitialMessage();

        if (_initialMessage != null) {
          onMessage(_initialMessage);
        }

        FirebaseMessaging.onMessageOpenedApp.listen(onMessage);

        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<PeamanEither<bool, PeamanError>> resetMessaging({
    required String uid,
  }) {
    return runAsyncCall(
      future: () async {
        final _deviceInfo = DeviceInfoPlugin();
        final _androidInfo = await _deviceInfo.androidInfo;

        final _deviceRef = PeamanReferenceHelper.devicesCol(
          uid: uid,
        ).doc(_androidInfo.androidId);

        await _deviceRef.delete();
        return const Success(true);
      },
      onError: Failure.new,
    );
  }
}
