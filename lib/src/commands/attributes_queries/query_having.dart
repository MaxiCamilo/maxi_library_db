import 'package:maxi_library_db/src/commands/attributes_queries/query_field.dart';
import 'package:maxi_library_db/src/commands/interfaces/icondition_query.dart';

class QueryHaving {
  final QueryField field;
  final IConditionQuery condition;

  const QueryHaving({required this.field, required this.condition});
}
