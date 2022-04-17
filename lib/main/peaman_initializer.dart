import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Peaman {
  static final _ref = FirebaseFirestore.instance;
  static final _auth = FirebaseAuth.instance;

  static Future<FirebaseApp> initializeApp() {
    return Firebase.initializeApp();
  }

  static FirebaseFirestore get ref => _ref;
  static FirebaseAuth? get auth => _auth;
}
