import 'package:either_dart/either.dart';
import 'package:peaman/src/features/shared/models/peaman_error.dart';

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
  @override
  // TODO: implement authUser
  Stream<Either<PeamanAuthUser?, PeamanError>> get authUser =>
      throw UnimplementedError();

  @override
  Future<Either<bool, PeamanError>> sendPasswordResetEmail({
    required String email,
  }) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<PeamanUser, PeamanError>> signUpWithEmailAndPassword({
    required PeamanUser user,
    required String email,
    required String password,
  }) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }
}
