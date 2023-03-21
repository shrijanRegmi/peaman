import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:peaman/peaman.dart';

abstract class PeamanAuthRepository {
  Future<PeamanEither<PeamanUser, PeamanError>> signUpWithEmailAndPassword({
    required final PeamanUser user,
    required final String email,
    required final String password,
  });

  Future<PeamanEither<bool, PeamanError>> signInWithEmailAndPassword({
    required final String email,
    required final String password,
  });

  Future<PeamanEither<bool, PeamanError>> sendPasswordResetEmail({
    required final String email,
  });

  Future<PeamanEither<bool, PeamanError>> signInWithGoogle();

  Future<PeamanEither<bool, PeamanError>> signInWithFacebook();

  Future<PeamanEither<bool, PeamanError>> signOut();

  Stream<PeamanAuthUser?> get authUser;
}

class PeamanAuthRepositoryImpl extends PeamanAuthRepository {
  PeamanAuthRepositoryImpl({
    required final PeamanUserRepository peamanUserRepository,
  }) : _peamanUserRepository = peamanUserRepository;

  final PeamanUserRepository _peamanUserRepository;
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  final _facebookSignIn = FacebookAuth.instance;

  @override
  Stream<PeamanAuthUser?> get authUser => _auth
      .authStateChanges()
      .map((e) => e == null ? null : PeamanAuthUser(uid: e.uid));

  @override
  Future<PeamanEither<bool, PeamanError>> sendPasswordResetEmail({
    required String email,
  }) {
    return runAsyncCall(
      future: () async {
        await _auth.sendPasswordResetEmail(email: email);
        return const Success(true);
      },
      onError: (e) {
        return Failure(e);
      },
    );
  }

  @override
  Future<PeamanEither<bool, PeamanError>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return runAsyncCall(
      future: () async {
        final _result = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (_result.user == null) {
          throw Exception('User from firestore was null');
        }
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<PeamanEither<bool, PeamanError>> signInWithFacebook() {
    return runAsyncCall(
      future: () async {
        final _account = await _facebookSignIn.login();

        if (_account.status != LoginStatus.success)
          throw Exception('${_account.status}');

        final _accessToken = _account.accessToken;
        if (_accessToken == null) throw Exception('Access Token is null');

        final _cred = FacebookAuthProvider.credential(_accessToken.token);
        final _result = await _auth.signInWithCredential(_cred);

        final _user = _result.user;
        if (_user == null) throw Exception('AuthUser is null');

        final _userRef = PeamanReferenceHelper.usersCol.doc(_user.uid);
        final _userSnap = await _userRef.get();

        final _registered = _userSnap.exists;
        if (!_registered) {
          final _appUser = PeamanUser(
            uid: _user.uid,
            email: _user.email,
            createdAt: _user.metadata.creationTime?.millisecondsSinceEpoch,
          );
          final _createUserResult =
              await _peamanUserRepository.createUser(user: _appUser);
          if (_createUserResult.isFailure) throw _createUserResult.failure;
        }

        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<PeamanEither<bool, PeamanError>> signInWithGoogle() {
    return runAsyncCall(
      future: () async {
        final _account = await _googleSignIn.signIn();

        if (_account == null) throw Exception('No account was selected');

        final _tokens = await _account.authentication;
        final _cred = GoogleAuthProvider.credential(
          idToken: _tokens.idToken,
          accessToken: _tokens.accessToken,
        );

        final _result = await _auth.signInWithCredential(_cred);

        final _user = _result.user;
        if (_user == null) throw Exception('AuthUser is null');

        final _userRef = PeamanReferenceHelper.usersCol.doc(_user.uid);
        final _userSnap = await _userRef.get();
        final _registered = _userSnap.exists;

        if (!_registered) {
          final _appUser = PeamanUser(
            uid: _user.uid,
            email: _user.email,
            createdAt: _user.metadata.creationTime?.millisecondsSinceEpoch,
          );
          final _createUserResult =
              await _peamanUserRepository.createUser(user: _appUser);
          if (_createUserResult.isFailure) throw _createUserResult.failure;
        }

        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<PeamanEither<bool, PeamanError>> signOut() {
    return runAsyncCall(
      future: () async {
        await Future.wait([
          _auth.signOut(),
          _googleSignIn.signOut(),
          _facebookSignIn.logOut(),
        ]);

        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<PeamanEither<PeamanUser, PeamanError>> signUpWithEmailAndPassword({
    required PeamanUser user,
    required String email,
    required String password,
  }) {
    return runAsyncCall(
      future: () async {
        final _result = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (_result.user == null) throw Exception('AuthUser is null');

        final _user = user.copyWith(
          uid: _result.user?.uid,
          createdAt:
              _result.user?.metadata.creationTime?.millisecondsSinceEpoch,
        );

        final _createUserResult = await _peamanUserRepository.createUser(
          user: _user,
        );
        if (_createUserResult.isFailure) throw _createUserResult.failure;

        return Success(_user);
      },
      onError: Failure.new,
    );
  }
}
