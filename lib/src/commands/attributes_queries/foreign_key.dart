import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
class ForeignKey {
  final String fieldName;
  final String tableName;
  final String referenceFieldName;

  const ForeignKey({
    required this.fieldName,
    required this.tableName,
    required this.referenceFieldName,
  });
}
