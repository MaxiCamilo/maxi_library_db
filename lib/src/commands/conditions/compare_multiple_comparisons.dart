import 'package:maxi_library_db/src/commands/interfaces/icondition_query.dart';

enum CompareMultipleComparisonsLogic { and, or }

class CompareMultipleComparisons with IConditionQuery {
  final CompareMultipleComparisonsLogic typeComparation;
  final List<IConditionQuery> conditions;

  const CompareMultipleComparisons({required this.conditions, this.typeComparation = CompareMultipleComparisonsLogic.and});
}
