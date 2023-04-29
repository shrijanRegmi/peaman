import 'package:firebase_core/firebase_core.dart';

import '../peaman.dart';

class Peaman {
  static Future<PeamanEither<bool, PeamanError>> initializeApp({
    String? name,
    PeamanOptions? options,
  }) {
    return runAsyncCall(
      future: () async {
        if (options != null) {
          PeamanReferenceHelper.mainCollectionPrefix =
              options.mainCollectionsPrefix;
          PeamanReferenceHelper.mainCollectionSuffix =
              options.mainCollectionsSuffix;
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
  final String mainCollectionsPrefix;
  final String mainCollectionsSuffix;

  const PeamanOptions({
    required String apiKey,
    required String appId,
    required String messagingSenderId,
    required String projectId,
    this.mainCollectionsSuffix = '',
    this.mainCollectionsPrefix = '',
  }) : super(
          apiKey: apiKey,
          appId: appId,
          messagingSenderId: messagingSenderId,
          projectId: projectId,
        );
}
