import 'package:cloud_functions/cloud_functions.dart';
import 'package:either_dart/either.dart';

import '../../shared/helpers/async_call_helper.dart';
import '../../shared/models/peaman_error_model.dart';

abstract class PeamanCloudFunctionRepository {
  Future<Either<dynamic, PeamanError>> callFunction({
    required final String functionName,
    final Map<String, dynamic>? data,
  });
}

class PeamanCloudFunctionRepositoryImpl extends PeamanCloudFunctionRepository {
  static final _functions = FirebaseFunctions.instance;

  @override
  Future<Either<dynamic, PeamanError>> callFunction({
    required String functionName,
    Map<String, dynamic>? data,
  }) {
    return runAsyncCall(
      future: () async {
        HttpsCallable callable = _functions.httpsCallable(functionName);
        final result = await callable.call(data);
        final resultData = result.data;
        return Left(resultData);
      },
      onError: Right.new,
    );
  }
}
