import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
class QueryCommand with IDataBaseCommand {
  final List<QueryField> selectedFields;
  final List<QueryTable> selectedTables;
  final List<QueryJoiner> joinedTables;
  final List<IConditionQuery> conditions;
  final List<QueryOrder> orders;
  final List<String> grouped;
  final List<IConditionQuery> havings;
  final int? limit;

  const QueryCommand({
    required this.selectedTables,
    this.selectedFields = const [],
    this.joinedTables = const [],
    this.conditions = const [],
    this.orders = const [],
    this.grouped = const [],
    this.havings = const [],
    this.limit,
  });
}
