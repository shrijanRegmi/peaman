import 'package:freezed_annotation/freezed_annotation.dart';

/// Base Either class
///
/// Receives two values [F] and [S]
/// as [F] is an failure and [S] is a success.
@sealed
abstract class PeamanEither<S, F> {
  /// Default constructor.
  const PeamanEither();

  /// Returns the current Either.
  ///
  /// It may be a [Success] or an [Failure].
  /// Check with
  /// ```dart
  ///   Either.isSuccess();
  /// ```
  /// or
  /// ```dart
  ///   Either.isFailure();
  /// ```
  ///
  /// before casting the value;
  dynamic get();

  /// Returns the value of [S].
  S get success;

  /// Returns the value of [F].
  F get failure;

  /// Returns true if the current Either is an [Failure].
  bool get isFailure;

  /// Returns true if the current Either is a [success].
  bool get isSuccess;

  /// Return the Either in one of these functions.
  ///
  /// if the Either is an failure, it will be returned in
  /// [whenFailure],
  /// if it is a success it will be returned in [whenSuccess].
  W when<W>(
    W Function(S success) whenSuccess,
    W Function(F failure) whenFailure,
  );
}

/// Success Either.
///
/// return it when the Either of a [PeamanEither] is
/// the expected value.
@immutable
class Success<S, F> implements PeamanEither<S, F> {
  /// Receives the [S] param as
  /// the successful Either.
  const Success(
    this._success,
  );

  final S _success;

  @override
  S get() {
    return _success;
  }

  @override
  bool get isFailure => false;

  @override
  bool get isSuccess => true;

  @override
  int get hashCode => _success.hashCode;

  @override
  bool operator ==(Object other) =>
      other is Success && other._success == _success;

  @override
  W when<W>(
    W Function(S success) whenSuccess,
    W Function(F failure) whenFailure,
  ) {
    return whenSuccess(_success);
  }

  @override
  F get failure => throw Exception(
        'Illegal use. You should check isFailure before calling',
      );

  @override
  S get success => _success;
}

/// Failure Either.
///
/// return it when the Either of a [PeamanEither] is
/// not the expected value.
@immutable
class Failure<S, F> implements PeamanEither<S, F> {
  /// Receives the [F] param as
  /// the failure Either.
  const Failure(this._failure);

  final F _failure;

  @override
  F get() {
    return _failure;
  }

  @override
  bool get isFailure => true;

  @override
  bool get isSuccess => false;

  @override
  int get hashCode => _failure.hashCode;

  @override
  bool operator ==(Object other) =>
      other is Failure && other._failure == _failure;

  @override
  W when<W>(
    W Function(S succcess) whenSuccess,
    W Function(F failure) whenFailure,
  ) {
    return whenFailure(_failure);
  }

  @override
  F get failure => _failure;

  @override
  S get success => throw Exception(
        'Illegal use. You should check isSuccess before calling',
      );
}

/// Default success class.
///
/// Instead of returning void, as
/// ```dart
///   Either<Exception, void>
/// ```
/// return
/// ```dart
///   Either<Exception, SuccessEither>
/// ```
class SuccessEither {
  const SuccessEither._internal();
}

/// Default success case.
const success = SuccessEither._internal();
