import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
class CompareFields with IConditionQuery {
  final String originField;
  final String compareField;
  final ConditionCompareType typeComparation;

  const CompareFields({required this.originField, required this.compareField, this.typeComparation = ConditionCompareType.equal});
}
