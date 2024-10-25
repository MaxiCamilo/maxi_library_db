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
  final IPrimitiveValueGenerator valueAdapter;
  final ColumnAttributesType columnType;
  final bool isPrimaryKey;
  final bool isUniqueKey;
  final bool isAutoIncrement;

  const ColumnAttributes({
    required this.nameColumn,
    required this.valueAdapter,
    required this.columnType,
    this.isPrimaryKey = false,
    this.isUniqueKey = false,
    this.isAutoIncrement = false,
  });

  factory ColumnAttributes.fromDartType({
    required String nameColumn,
    required IPrimitiveValueGenerator type,
    required bool isPrimaryKey,
    required bool isUniqueKey,
    List<dynamic> annotations = const [],
  }) {

    return ColumnAttributes(
      nameColumn: nameColumn,
      valueAdapter: type,
      columnType: searchColumnType(type),
      isPrimaryKey: isPrimaryKey,
      isUniqueKey: isUniqueKey,
    );
  }

  static ColumnAttributesType searchColumnType(IPrimitiveValueGenerator adapter) {
    return switch (adapter.primitiveType) {
      PrimitiesType.isInt => ColumnAttributesType.intWithoutLimit,
      PrimitiesType.isDouble => ColumnAttributesType.doubleWithoutLimit,
      PrimitiesType.isNum => ColumnAttributesType.doubleWithoutLimit,
      PrimitiesType.isString => ColumnAttributesType.text,
      PrimitiesType.isBoolean => ColumnAttributesType.boolean,
      PrimitiesType.isDateTime => ColumnAttributesType.dateTime,
      PrimitiesType.isBinary => ColumnAttributesType.binary,
    };
  }
}
