enum ColumnAttributesType {
  text,
  boolean,
  intWithoutLimit,
  int8,
  int16,
  int32,
  int64,
  uintWithoutLimit,
  uint8,
  uint16,
  uint32,
  uint64,
  double,
  decimal,
  dateTime,
  binary,
  dynamic,
}

class ColumnAttributes {
  final String nameColumn;
  final ColumnAttributesType type;
  final bool isPrimaryKey;
  final bool isUniqueKey;

  const ColumnAttributes({
    required this.nameColumn,
    required this.type,
    required this.isPrimaryKey,
    required this.isUniqueKey,
  });
}
