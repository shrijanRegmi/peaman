import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Peaman {
  static final _ref = FirebaseFirestore.instance;

  static Future initializeApp() async {
    return await Firebase.initializeApp();
  }

  static FirebaseFirestore get ref => _ref;
}
