import 'package:firebase_auth/firebase_auth.dart';
import 'package:peaman/models/user_model.dart';
import 'package:peaman/services/database_services/user_provider.dart';

class AuthProvider {
  final PeamanUser? appUser;
  final String? password;

  AuthProvider({
    this.appUser,
    this.password,
  });

  final _auth = FirebaseAuth.instance;

  // create account with email and password
  Future signUpWithEmailAndPassword() async {
    try {
      final _result = await _auth.createUserWithEmailAndPassword(
        email: appUser?.email ?? '',
        password: password ?? '',
      );

      final _user = appUser?.copyWith(uid: _result.user?.uid);

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

  // log out user
  Future logOut() async {
    print('Success: Logging out user');
    return await _auth.signOut();
  }

  // user from firebase
  PeamanUser? _userFromFirebase(User? user) {
    return user != null
        ? PeamanUser(
            uid: user.uid,
            name: null,
            email: null,
            photoUrl: null,
            appUserRef: null,
          )
        : null;
  }

  // stream of user
  Stream<PeamanUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }
}
