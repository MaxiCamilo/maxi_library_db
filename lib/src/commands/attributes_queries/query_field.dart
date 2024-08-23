import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
enum QueryFieldType { field, count, maximum, minimum, average, sum }

@reflectByMaxiLibraryDb
class QueryField {
  final QueryFieldType type;
  final String fieldName;
  final String nickName;

  const QueryField({
    this.type = QueryFieldType.field,
    this.fieldName = '',
    this.nickName = '',
  });
}
