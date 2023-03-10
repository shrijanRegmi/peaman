import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:peaman/helpers/async_call_helper.dart';
import 'package:peaman/src/features/shared/models/peaman_error.dart';
import 'package:peaman/src/features/user/repositories/user_repository.dart';

import '../../../../helpers/reference_helper.dart';
import '../../user/models/user_model.dart';
import '../models/auth_user_model.dart';

abstract class PeamanAuthRepository {
  Future<Either<PeamanUser, PeamanError>> signUpWithEmailAndPassword({
    required final PeamanUser user,
    required final String email,
    required final String password,
  });

  Future<Either<bool, PeamanError>> signInWithEmailAndPassword({
    required final String email,
    required final String password,
  });

  Future<Either<bool, PeamanError>> sendPasswordResetEmail({
    required final String email,
  });

  Future<Either<bool, PeamanError>> signInWithGoogle();

  Future<Either<bool, PeamanError>> signInWithFacebook();

  Future<Either<bool, PeamanError>> signOut();

  Stream<Either<PeamanAuthUser?, PeamanError>> get authUser;
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
  Stream<Either<PeamanAuthUser?, PeamanError>> get authUser => _auth
      .authStateChanges()
      .map((e) => Left(e == null ? null : PeamanAuthUser(uid: e.uid)));

  @override
  Future<Either<bool, PeamanError>> sendPasswordResetEmail({
    required String email,
  }) {
    return runAsyncCall(
      future: () async {
        await _auth.sendPasswordResetEmail(email: email);
        return Left(true);
      },
      onError: (e) {
        return Right(e);
      },
    );
  }

  @override
  Future<Either<bool, PeamanError>> signInWithEmailAndPassword({
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
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> signInWithFacebook() {
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
          if (_createUserResult.isRight) throw _createUserResult.right;
        }

        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> signInWithGoogle() {
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
          if (_createUserResult.isRight) throw _createUserResult.right;
        }

        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> signOut() {
    return runAsyncCall(
      future: () async {
        await Future.wait([
          _auth.signOut(),
          _googleSignIn.signOut(),
          _facebookSignIn.logOut(),
        ]);

        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<PeamanUser, PeamanError>> signUpWithEmailAndPassword({
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
        if (_createUserResult.isRight) throw _createUserResult.right;

        return Left(_user);
      },
      onError: Right.new,
    );
  }
}
