import 'package:maxi_library_db/src/commands/interfaces/icondition_query.dart';

class CompareValue with IConditionQuery {
  final String originField;
  final dynamic value;
  final ConditionCompareType typeComparation;
  final bool shieldValue;

  const CompareValue({
    required this.originField,
    required this.value,
    required this.typeComparation,
    this.shieldValue = true,
  });
}
