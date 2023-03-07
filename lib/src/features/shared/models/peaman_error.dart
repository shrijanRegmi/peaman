class PeamanError {
  final String message;
  final String? code;
  final String? detailedMessage;

  PeamanError({
    required this.message,
    this.code,
    this.detailedMessage,
  });
}
