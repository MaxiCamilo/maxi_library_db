import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

@reflect
enum CompareMultipleComparisonsLogic { and, or }

@reflect
class CompareMultipleComparisons with IConditionQuery {
  final CompareMultipleComparisonsLogic typeComparation;
  final List<IConditionQuery> conditions;

  const CompareMultipleComparisons({required this.conditions, this.typeComparation = CompareMultipleComparisonsLogic.and});
}
