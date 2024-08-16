import 'package:maxi_library_db/src/commands/conditions/compare_fields.dart';

enum QueryJoinerType { inner, left, rigth, fullOuter }

class QueryJoiner {
  final String tableName;
  final QueryJoinerType type;
  final List<CompareFields> comparers;

  const QueryJoiner({
    required this.tableName,
    required this.comparers,
    this.type = QueryJoinerType.inner,
  });
}
