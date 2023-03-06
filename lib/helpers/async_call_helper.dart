import 'dart:developer';

/// Used to abstract the error handling when making API requests.
/// For a function [future], executes the [onError]
/// and catches the error. Also logs the error.
///
/// This function is based on the premise that exceptions should not
/// propagate further unhandled from the repository layer.
Future<T> runAsyncCall<T>({
  required Future<T> Function() future,
  required T Function() onError,
}) async {
  try {
    final response = await future();
    return response;
  } catch (e, stk) {
    log(
      '$future: An error occurred.',
      name: '$future',
      error: e,
      stackTrace: stk,
    );
    return onError();
  }
}
