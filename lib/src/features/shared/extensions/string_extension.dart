extension StringExt on String {
  String get toJsonKey {
    RegExp exp = RegExp(r'(?<=[a-z])[A-Z]');
    String result = replaceAllMapped(exp, (Match m) => ('_${m.group(0) ?? ''}'))
        .toLowerCase();
    return result;
  }
}
