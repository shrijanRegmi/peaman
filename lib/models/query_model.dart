class PeamanQuery {
  final String? orderBy;
  final bool descending;
  final String? whereKey;
  final String? whereValue;
  PeamanQuery({
    this.orderBy,
    this.descending = false,
    this.whereKey,
    this.whereValue,
  });
}
