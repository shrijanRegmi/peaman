import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:peaman/peaman.dart';

class Peaman {
  static final _ref = FirebaseFirestore.instance;

  static Future initializeApp() async {
    return await Firebase.initializeApp();
  }

  static Future<void> addDataToDatabase({
    required final String docPath,
    required final Map<String, dynamic> data,
  }) async {
    try {
      final _reff = _ref.doc(docPath);
      await _reff.set(data);
      print('Success: Adding data to database $docPath');
    } catch (e) {
      print(e);
      print('Error!!!: Adding data to database');
    }
  }

  static Stream<List<dynamic>> getDatasFromDatabase({
    required final String colPath,
    final PeamanQuery? query,
  }) {
    return _ref
        .collection(colPath)
        .where('${query?.whereKey}', isEqualTo: query?.whereValue)
        .orderBy('${query?.orderBy}', descending: query?.descending ?? false)
        .snapshots()
        .map(
          (event) => event.docs.map((e) => e.data()).toList(),
        );
  }

  static Stream<dynamic> getSingleDataFromDatabase({
    required final String docPath,
  }) {
    return _ref.doc(docPath).snapshots().map((event) => event.data());
  }
}
