enum PeamanFieldType {
  normal,
  positivePartial,
  negativePartial,
  delete,
}

class PeamanField {
  final String key;
  final dynamic value;
  final bool useKeyAsItIs;
  final PeamanFieldType type;

  const PeamanField({
    required this.key,
    required this.value,
    this.useKeyAsItIs = false,
  }) : type = PeamanFieldType.normal;

  const PeamanField.positivePartial({
    required this.key,
    required this.value,
    this.useKeyAsItIs = false,
  }) : type = PeamanFieldType.positivePartial;

  const PeamanField.negativePartial({
    required this.key,
    required this.value,
    this.useKeyAsItIs = false,
  }) : type = PeamanFieldType.negativePartial;

  const PeamanField.delete({
    required this.key,
    this.useKeyAsItIs = false,
  })  : type = PeamanFieldType.negativePartial,
        value = '';
}
