import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:peaman/models/user_model.dart';
import 'package:peaman/services/database_services/user_provider.dart';

class AuthProvider {
  final PeamanUser? appUser;
  final String? password;

  AuthProvider({
    this.appUser,
    this.password,
  });

  final _ref = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  // create account with email and password
  Future signUpWithEmailAndPassword() async {
    try {
      final _result = await _auth.createUserWithEmailAndPassword(
        email: appUser?.email ?? '',
        password: password ?? '',
      );

      final _user = appUser?.copyWith(
        uid: _result.user?.uid,
      );

      await AppUserProvider(user: _user).sendUserToFirestore();

      _userFromFirebase(_result.user);
      print('Success: Creating user with name ${_user?.name}');
      return _result;
    } catch (e) {
      print(e);
      print('Error!!!: Creating user with name ${appUser?.name}');
      return null;
    }
  }

  // login with email and password
  Future loginWithEmailAndPassword() async {
    try {
      final _result = await _auth.signInWithEmailAndPassword(
        email: appUser?.email ?? '',
        password: password ?? '',
      );
      _userFromFirebase(_result.user);
      print('Success: Logging in user with email ${appUser?.email}');
      return _result;
    } catch (e) {
      print(e);
      print('Error!!!: Logging in user with email ${appUser?.email}');
      return null;
    }
  }

  // sign up with google
  Future<void> signUpWithGoogle({
    final Function()? onSuccess,
    final Function()? onError,
  }) async {
    try {
      final _account = await _googleSignIn.signIn();

      if (_account != null) {
        final _tokens = await _account.authentication;
        final _cred = GoogleAuthProvider.credential(
          idToken: _tokens.idToken,
          accessToken: _tokens.accessToken,
        );
        final _result = await _auth.signInWithCredential(_cred);
        final _user = _result.user;

        if (_user != null) {
          final _usersRef = _ref
              .collection('users')
              .where('email', isEqualTo: _user.email)
              .limit(1);
          final _usersSnap = await _usersRef.get();
          final _registered = _usersSnap.docs.isNotEmpty;

          if (!_registered) {
            final _appUser = PeamanUser(
              uid: _user.uid,
              email: _user.email,
            );
            await AppUserProvider(user: _appUser).sendUserToFirestore();
          }
          print('Success: Signing up with google');
        }
      }
    } catch (e) {
      print(e);
      print('Error!!!: Signing up with google');
    }
  }

  // log out user
  Future logOut() async {
    print('Success: Logging out user');
    return await _auth.signOut();
  }

  // user from firebase
  PeamanUser? _userFromFirebase(User? user) {
    return user != null ? PeamanUser(uid: user.uid) : null;
  }

  // stream of user
  Stream<PeamanUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }
}
