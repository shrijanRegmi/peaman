import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:peaman/services/database_services/user_provider.dart';

import '../../peaman.dart';

class AuthProvider {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  final _facebookSignIn = FacebookAuth.instance;

  // create account with email and password
  Future<void> signUpWithEmailAndPassword({
    required final String email,
    required final String password,
    required final PeamanUser appUser,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final _user = appUser.copyWith(
        uid: _result.user?.uid,
        createdAt: _result.user?.metadata.creationTime?.millisecondsSinceEpoch,
      );

      await AppUserProvider().createUser(user: _user);
      _userFromFirebase(_result.user);

      print('Success: Creating user with name ${_user.name}');
      if (_result.user != null) {
        onSuccess?.call(_result.user!.uid);
      }
    } catch (e) {
      print(e);
      print('Error!!!: Creating user');
      onError?.call(e);
    }
  }

  // login with email and password
  Future<void> loginWithEmailAndPassword({
    required final String email,
    required final String password,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _userFromFirebase(_result.user);
      print('Success: Logging in user with email $email');
      if (_result.user == null) {
        throw Future.error('User from firestore was null');
      }

      onSuccess?.call(_result.user!.uid);
    } catch (e) {
      print(e);
      print('Error!!!: Logging in user with email');
      onError?.call(e);
    }
  }

  // sign up with google
  Future<void> signUpWithGoogle({
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _account = await _googleSignIn.signIn();

      if (_account == null) throw Exception('No account was selected');

      final _tokens = await _account.authentication;
      final _cred = GoogleAuthProvider.credential(
        idToken: _tokens.idToken,
        accessToken: _tokens.accessToken,
      );
      final _result = await _auth.signInWithCredential(_cred);
      final _user = _result.user;

      if (_user != null) {
        final _userRef = PeamanReferenceHelper.usersCol.doc(_user.uid);
        final _userSnap = await _userRef.get();
        final _registered = _userSnap.exists;

        if (!_registered) {
          final _appUser = PeamanUser(
            uid: _user.uid,
            email: _user.email,
            createdAt: _user.metadata.creationTime?.millisecondsSinceEpoch,
          );
          await AppUserProvider().createUser(user: _appUser);
        }

        print('Success: Signing up with google');
        onSuccess?.call(_user.uid);
      }
    } catch (e) {
      print(e);
      print('Error!!!: Signing up with google');
      onError?.call(e);
    }
  }

  // sign up with facebook
  Future<void> signUpWithFacebook({
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _account = await _facebookSignIn.login();

      if (_account.status != LoginStatus.success) {
        throw Exception('${_account.status}');
      }

      final _accessToken = _account.accessToken;

      if (_accessToken == null) throw Exception('Access Token is null');

      final _cred = FacebookAuthProvider.credential(_accessToken.token);
      final _result = await _auth.signInWithCredential(_cred);
      final _user = _result.user;

      if (_user != null) {
        final _userRef = PeamanReferenceHelper.usersCol.doc(_user.uid);
        final _userSnap = await _userRef.get();
        final _registered = _userSnap.exists;

        if (!_registered) {
          final _appUser = PeamanUser(
            uid: _user.uid,
            email: _user.email,
            createdAt: _user.metadata.creationTime?.millisecondsSinceEpoch,
          );
          await AppUserProvider().createUser(user: _appUser);
        }

        print('Success: Signing up with facebook');
        onSuccess?.call(_user.uid);
      }
    } catch (e) {
      print(e);
      print('Error!!!: Signing up with facebook');
      onError?.call(e);
    }
  }

  // send password reset email
  Future<void> sendPasswordResetEmail({
    required final String email,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      print('Success: Sending password reset email');
    } catch (e) {
      print(e);
      print('Error!!!: Sending password reset email');
    }
  }

  // log out user
  Future<void> logOut() async {
    await Future.wait([
      _auth.signOut(),
      _googleSignIn.signOut(),
      _facebookSignIn.logOut(),
    ]);
    print('Success: Logging out user');
  }

  // single user from firebase
  PeamanUser? _userFromFirebase(User? user) {
    return user != null ? PeamanUser(uid: user.uid) : null;
  }

  // stream of user
  Stream<PeamanUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }
}
