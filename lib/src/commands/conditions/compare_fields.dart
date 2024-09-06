import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

@reflect
class CompareFields with IConditionQuery {
  final String originField;
  final String compareField;
  final String originFieldTable;
  final String compareFieldTable;

  final ConditionCompareType typeComparation;

  const CompareFields({
    required this.originField,
    required this.compareField,
    this.typeComparation = ConditionCompareType.equal,
    this.originFieldTable = '',
    this.compareFieldTable = '',
  });
}
