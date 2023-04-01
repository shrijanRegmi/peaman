import 'package:freezed_annotation/freezed_annotation.dart';

part 'peaman_error_model.freezed.dart';

@freezed
class PeamanError with _$PeamanError {
  const factory PeamanError({
    required final String message,
    final String? code,
    final String? detailedMessage,
  }) = _PeamanError;
}
