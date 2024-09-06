import 'dart:typed_data';

import 'package:maxi_library/maxi_library.dart';

@reflect
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
  doubleWithoutLimit,
  decimal,
  dateTime,
  binary,
  dynamicType,
}

@reflect
class ColumnAttributes {
  final String nameColumn;
  final ColumnAttributesType type;
  final bool isPrimaryKey;
  final bool isUniqueKey;
  final bool isAutoIncrement;

  const ColumnAttributes({
    required this.nameColumn,
    required this.type,
    this.isPrimaryKey = false,
    this.isUniqueKey = false,
    this.isAutoIncrement = false,
  });

  factory ColumnAttributes.fromDartType({
    required String nameColumn,
    required Type type,
    required bool isPrimaryKey,
    required bool isUniqueKey,
  }) {
    return ColumnAttributes(
      nameColumn: nameColumn,
      type: searchColumnType(type),
      isPrimaryKey: isPrimaryKey,
      isUniqueKey: isUniqueKey,
    );
  }

  static ColumnAttributesType searchColumnType(Type dartType) {
    return switch (dartType) {
      const (String) => ColumnAttributesType.text,
      const (int) => ColumnAttributesType.intWithoutLimit,
      const (double) => ColumnAttributesType.doubleWithoutLimit,
      const (num) => ColumnAttributesType.doubleWithoutLimit,
      const (bool) => ColumnAttributesType.boolean,
      const (Enum) => ColumnAttributesType.uint8,
      const (DateTime) => ColumnAttributesType.dateTime,
      const (Uint8List) || const (List<int>) => ColumnAttributesType.binary,
      _ => throw NegativeResult(identifier: NegativeResultCodes.wrongType, message: trc('The type %1 is not compatible for a database column', [dartType.toString()]))
    };
  }
}
