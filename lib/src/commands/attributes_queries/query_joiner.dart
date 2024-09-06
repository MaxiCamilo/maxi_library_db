import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

@reflect
enum QueryJoinerType { inner, left, rigth, fullOuter }

@reflect
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
