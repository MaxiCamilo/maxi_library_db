import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
class CompareIncludesValues with IConditionQuery {
  final String fieldName;
  final String selectedTable;
  final List options;
  final bool shieldValue;
  final bool isInclusive;

  const CompareIncludesValues({
    required this.fieldName,
    required this.options,
    this.selectedTable = '',
    this.shieldValue = true,
    this.isInclusive = true,
  });
}
