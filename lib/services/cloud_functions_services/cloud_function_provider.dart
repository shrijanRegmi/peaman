import 'package:cloud_functions/cloud_functions.dart';

class CloudFunctionsProvider {
  static final functions = FirebaseFunctions.instance;

  static Future<void> callFunction({
    required final String functionName,
    final Map<String, dynamic>? data,
    final Function(Map<String, dynamic>)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      HttpsCallable callable = functions.httpsCallable('listFruit');
      final result = await callable.call(data);
      final resultData = result.data as Map<String, dynamic>;

      onSuccess?.call(resultData);
      print('Success: Calling function - $functionName');
    } catch (e) {
      print(e);
      print('Error!!!: Calling function - $functionName');
      onError?.call(e);
    }
  }
}
