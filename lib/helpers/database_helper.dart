import 'package:cloud_firestore/cloud_firestore.dart';

class PeamanDatabaseHelper {
  static FieldValue fieldValueIncrement(num value) {
    return FieldValue.increment(value);
  }

  static FieldValue fieldValueArrayUnion(List<dynamic> value) {
    return FieldValue.arrayUnion(value);
  }

  static FieldValue fieldValueArrayRemove(List<dynamic> value) {
    return FieldValue.arrayRemove(value);
  }

  static FieldValue fieldValueDelete(List<dynamic> value) {
    return FieldValue.delete();
  }

  static FieldValue fieldValueTimestamp(List<dynamic> value) {
    return FieldValue.serverTimestamp();
  }
}
