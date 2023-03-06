enum PeamanFieldType {
  normal,
  positivePartial,
  negativePartial,
  delete,
}

class PeamanField {
  final String key;
  final String value;
  final PeamanFieldType type;

  const PeamanField({
    required this.key,
    required this.value,
  }) : type = PeamanFieldType.normal;

  const PeamanField.positivePartial({
    required this.key,
    required this.value,
  }) : type = PeamanFieldType.positivePartial;

  const PeamanField.negativePartial({
    required this.key,
    required this.value,
  }) : type = PeamanFieldType.negativePartial;

  const PeamanField.delete({
    required this.key,
  })  : type = PeamanFieldType.negativePartial,
        value = '';
}
