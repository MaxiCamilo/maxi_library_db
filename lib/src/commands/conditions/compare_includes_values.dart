import 'package:maxi_library_db/src/commands/interfaces/icondition_query.dart';

class CompareIncludesValues with IConditionQuery {
  final String fieldName;
  final List options;
  final bool shieldValue;
  final bool isInclusive;

  const CompareIncludesValues({
    required this.fieldName,
    required this.options,
    this.shieldValue = true,
    this.isInclusive = true,
  });
}
