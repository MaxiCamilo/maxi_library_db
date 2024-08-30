import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
class CompareSimilarText with IConditionQuery {
  final String fieldName;
  final String similarText;
  final bool shieldValue;
  final String selectedTable;

  const CompareSimilarText({
    required this.fieldName,
    required this.similarText,
    this.shieldValue = true,
    this.selectedTable = '',
  });
}
