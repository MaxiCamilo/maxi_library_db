import 'package:maxi_library_db/src/commands/interfaces/icondition_query.dart';

enum CompareSimilarTextType { portion, startWith, endWith }

class CompareSimilarText with IConditionQuery {
  final String fieldName;
  final String similarText;
  final bool shieldValue;
  final CompareSimilarTextType type;

  const CompareSimilarText({
    required this.fieldName,
    required this.similarText,
    this.shieldValue = true,
    this.type = CompareSimilarTextType.portion,
  });
}
