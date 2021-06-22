import 'package:firebase_core/firebase_core.dart';

class Peaman {
  static Future initializeApp() async {
    return await Firebase.initializeApp();
  }
}
