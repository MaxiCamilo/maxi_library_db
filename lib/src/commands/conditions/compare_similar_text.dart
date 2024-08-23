import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
enum CompareSimilarTextType { portion, startWith, endWith }

@reflectByMaxiLibraryDb
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
