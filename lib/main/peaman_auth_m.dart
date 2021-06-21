import 'package:firebase_auth/firebase_auth.dart';
import 'package:peaman/models/user_model.dart';
import 'package:peaman/services/auth_services/auth_provider.dart';

class PAuthProvider {
  static final _auth = FirebaseAuth.instance;

  static Future<void> loginWithEmailAndPassword(
    final String email,
    final String password,
  ) async {
    final _appUser = PeamanUser(
      email: email,
    );
    return await AuthProvider(appUser: _appUser, password: password)
        .loginWithEmailAndPassword();
  }

  static Future<void> signUpWithEmailAndPassword(
      final PeamanUser appUser, final String password) async {
    await AuthProvider(appUser: appUser, password: password)
        .signUpWithEmailAndPassword();
  }

  static Future<void> logOut(
      final PeamanUser appUser, final String password) async {
    return await AuthProvider().logOut();
  }

  static PeamanUser? _userFromFirebase(User? user) {
    return user != null ? PeamanUser(uid: user.uid) : null;
  }

  static Stream<PeamanUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }
}
