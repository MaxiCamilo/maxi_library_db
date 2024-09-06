import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

@reflect
class CompareSimilarText with IConditionQuery {
  final String fieldName;
  final String similarText;
  final bool shieldValue;
  final String selectedTable;

  const CompareSimilarText({
    required this.fieldName,
    required this.similarText,
    this.shieldValue = true,
    this.selectedTable = '',
  });
}
