import 'package:maxi_library_db/src/commands/attributes_queries/query_field.dart';
import 'package:maxi_library_db/src/commands/attributes_queries/query_grouper.dart';
import 'package:maxi_library_db/src/commands/attributes_queries/query_having.dart';
import 'package:maxi_library_db/src/commands/attributes_queries/query_joiner.dart';
import 'package:maxi_library_db/src/commands/attributes_queries/query_order.dart';
import 'package:maxi_library_db/src/commands/interfaces/icondition_query.dart';
import 'package:maxi_library_db/src/commands/interfaces/idatabase_command.dart';

class QueryCommand with IDatabaseCommand {
  final List<QueryField> selectedFields;
  final List<String> selectedTables;
  final List<QueryJoiner> joinedTables;
  final List<IConditionQuery> conditions;
  final List<QueryOrder> orders;
  final List<QueryGrouper> groupers;
  final List<QueryHaving> havings;
  final int? limit;

  const QueryCommand({
    required this.selectedTables,
    this.selectedFields = const [],
    this.joinedTables = const [],
    this.conditions = const [],
    this.orders = const [],
    this.groupers = const [],
    this.havings = const [],
    this.limit,
  });
}
