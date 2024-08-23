import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
enum CompareMultipleComparisonsLogic { and, or }

@reflectByMaxiLibraryDb
class CompareMultipleComparisons with IConditionQuery {
  final CompareMultipleComparisonsLogic typeComparation;
  final List<IConditionQuery> conditions;

  const CompareMultipleComparisons({required this.conditions, this.typeComparation = CompareMultipleComparisonsLogic.and});
}
