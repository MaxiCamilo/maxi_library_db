import 'package:maxi_library/maxi_library.dart';

@reflect
enum QueryFieldType { field, count, maximum, minimum, average, sum }

@reflect
class QueryField {
  final QueryFieldType type;
  final String fieldName;
  final String nickName;
  final String tableName;

  const QueryField({
    this.type = QueryFieldType.field,
    this.fieldName = '',
    this.nickName = '',
    this.tableName = '',
  });
}
