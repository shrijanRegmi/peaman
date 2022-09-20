import 'package:peaman/services/cloud_functions_services/cloud_function_provider.dart';

class PCloudFunctionProvider {
  static Future<void> callFunction({
    required final String functionName,
    final Map<String, dynamic>? data,
    final Function(Map<String, dynamic>)? onSuccess,
    final Function(dynamic)? onError,
  }) {
    return CloudFunctionsProvider.callFunction(
      functionName: functionName,
      data: data,
      onSuccess: onSuccess,
      onError: onError,
    );
  }
}
