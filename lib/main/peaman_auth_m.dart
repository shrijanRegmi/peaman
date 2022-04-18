import 'package:firebase_auth/firebase_auth.dart';
import 'package:peaman/models/user_model.dart';
import 'package:peaman/services/auth_services/auth_provider.dart';

import '../helpers/common_helper.dart';

class PAuthProvider {
  static final _auth = FirebaseAuth.instance;

  static Future<void> loginWithEmailAndPassword({
    required final String email,
    required final String password,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) {
    return AuthProvider().loginWithEmailAndPassword(
      email: email,
      password: password,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> signUpWithEmailAndPassword({
    required final String email,
    required final String password,
    required final PeamanUser appUser,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) {
    return AuthProvider().signUpWithEmailAndPassword(
      email: email,
      password: password,
      appUser: appUser,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> signInWithGoogle({
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) {
    return AuthProvider().signUpWithGoogle(
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> sendPasswordResetEmail({
    required final String email,
  }) {
    return AuthProvider().sendPasswordResetEmail(
      email: email,
    );
  }

  static Future<void> logOut() {
    return AuthProvider().logOut();
  }

  static PeamanUser? _userFromFirebase(User? user) {
    return user != null ? PeamanUser(uid: user.uid) : null;
  }

  static Stream<PeamanUser?> get user {
    PeamanCommonHelper.printListening(text: 'authUser');
    return _auth.authStateChanges().map(_userFromFirebase);
  }
}
