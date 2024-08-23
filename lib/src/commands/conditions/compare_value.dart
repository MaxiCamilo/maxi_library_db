import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
class CompareValue with IConditionQuery {
  final String originField;
  final dynamic value;
  final ConditionCompareType typeComparation;
  final bool shieldValue;

  const CompareValue({
    required this.originField,
    required this.value,
    this.typeComparation = ConditionCompareType.equal,
    this.shieldValue = true,
  });
}
