import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
enum QueryJoinerType { inner, left, rigth, fullOuter }

@reflectByMaxiLibraryDb
class QueryJoiner {
  final QueryTable originTable;
  final QueryTable externalTable;
  final QueryJoinerType type;
  final List<CompareFields> comparers;

  const QueryJoiner({
    required this.originTable,
    required this.externalTable,
    required this.comparers,
    this.type = QueryJoinerType.inner,
  });
}
