import 'package:cloud_firestore/cloud_firestore.dart';

class PeamanCommonHelper {
  // print listening to
  static void printListening({required final String text}) {
    print('Started getting $text');
  }

  // prepare data to update on firestore
  static Map<String, dynamic> prepareDataToUpdate({
    required final Map<String, dynamic> data,
    final bool partial = false,
  }) {
    var _data = data;

    if (partial) {
      data.forEach((key, value) {
        if (value is int || value is double) {
          _data[key] = FieldValue.increment(value);
        } else if (value is List) {
          _data[key] = FieldValue.arrayUnion(value);
        }
      });
    }

    return _data;
  }
}
