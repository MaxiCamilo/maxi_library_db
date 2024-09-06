import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

@reflect
class CompareValue with IConditionQuery {
  final String originField;
  final dynamic value;
  final ConditionCompareType typeComparation;
  final bool shieldValue;
  final String selectedTable;

  const CompareValue({
    required this.originField,
    required this.value,
    this.typeComparation = ConditionCompareType.equal,
    this.shieldValue = true,
    this.selectedTable = '',
  });
}
