import 'package:firebase_auth/firebase_auth.dart';
import 'package:peaman/models/user_model.dart';
import 'package:peaman/services/auth_services/auth_provider.dart';

import '../helpers/common_helper.dart';

class PAuthProvider {
  static final _auth = FirebaseAuth.instance;

  static Future<void> loginWithEmailAndPassword({
    required final String email,
    required final String password,
  }) {
    final _appUser = PeamanUser(email: email);
    return AuthProvider(
      appUser: _appUser,
      password: password,
    ).loginWithEmailAndPassword();
  }

  static Future<void> signUpWithEmailAndPassword({
    required final PeamanUser appUser,
    required final String password,
  }) {
    return AuthProvider(
      appUser: appUser,
      password: password,
    ).signUpWithEmailAndPassword();
  }

  static Future<void> signInWithGoogle({
    final Function()? onSuccess,
    final Function()? onError,
  }) {
    return AuthProvider().signUpWithGoogle(
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> logOut() {
    return AuthProvider().logOut();
  }

  static PeamanUser? _userFromFirebase(User? user) {
    return user != null ? PeamanUser(uid: user.uid) : null;
  }

  static Stream<PeamanUser?> get user {
    CommonHelper.printListening(text: 'authUser');
    return _auth.authStateChanges().map(_userFromFirebase);
  }
}
