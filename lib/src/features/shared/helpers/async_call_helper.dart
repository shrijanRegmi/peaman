import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/src/features/shared/models/peaman_error_model.dart';

/// Used to abstract the error handling when making API requests.
/// For a function [future], executes the [onError]
/// and catches the error. Also logs the error.
///
/// This function is based on the premise that exceptions should not
/// propagate further unhandled from the repository layer.
Future<T> runAsyncCall<T>({
  required Future<T> Function() future,
  required T Function(PeamanError) onError,
  final bool withLog = true,
}) async {
  try {
    final response = await future();
    if (withLog) {
      log(
        'Success: $future executed successfully',
        name: '$future',
      );
    }
    return response;
  } catch (e, stk) {
    if (withLog) {
      log(
        'Error!!!: $future executed with an error',
        name: '$future',
        error: e,
        stackTrace: stk,
      );
    }

    var peamanError = PeamanError(
      message: '$future: An error occurred',
      detailedMessage: e.toString(),
    );

    if (e is FirebaseException) {
      peamanError = PeamanError(
        message: e.message.toString(),
        detailedMessage: e.toString(),
        code: e.code,
      );
    }

    if (e is Exception) {
      peamanError = PeamanError(
        message: e.toString(),
      );
    }

    if (e is PeamanError) {
      peamanError = e;
    }

    return onError(peamanError);
  }
}
