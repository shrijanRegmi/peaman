import 'package:firebase_core/firebase_core.dart';

import '../peaman.dart';

class Peaman {
  static Future<PeamanEither<bool, PeamanError>> initializeApp({
    final String? name,
    final String? mainCollectionPrefix,
    final String? mainCollectionSuffix,
    final PeamanOptions? options,
  }) {
    return runAsyncCall(
      future: () async {
        if (mainCollectionPrefix != null) {
          PeamanReferenceHelper.mainCollectionPrefix = mainCollectionPrefix;
        }
        if (mainCollectionSuffix != null) {
          PeamanReferenceHelper.mainCollectionSuffix = mainCollectionSuffix;
        }

        await Firebase.initializeApp(
          name: name,
          options: options,
        );
        return const Success(true);
      },
      onError: Failure.new,
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
          projectId: projectId,
        );
}
