import 'package:maxi_library_db/src/commands/interfaces/icondition_query.dart';

class CompareFields with IConditionQuery {
  final String originField;
  final String compareField;
  final ConditionCompareType typeComparation;

  const CompareFields({required this.originField, required this.compareField, this.typeComparation = ConditionCompareType.equal});
}
