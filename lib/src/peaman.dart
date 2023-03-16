import 'package:either_dart/either.dart';
import 'package:firebase_core/firebase_core.dart';

import '../peaman.dart';

class Peaman {
  static Future<Either<bool, PeamanError>> initializeApp({
    String? name,
    PeamanOptions? options,
  }) {
    return runAsyncCall(
      future: () async {
        Firebase.initializeApp(
          name: name,
          options: options,
        );
        return const Left(true);
      },
      onError: Right.new,
    );
  }
}

class PeamanOptions extends FirebaseOptions {
  const PeamanOptions({
    required String apiKey,
    required String appId,
    required String messagingSenderId,
    required String projectId,
  }) : super(
            apiKey: apiKey,
            appId: appId,
            messagingSenderId: messagingSenderId,
            projectId: projectId);
}
