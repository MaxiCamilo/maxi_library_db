import 'package:maxi_library_db/src/commands/interfaces/icondition_query.dart';

class DeleteCommand {
  final String tableName;
  final List<IConditionQuery> conditions;

  const DeleteCommand({required this.tableName, this.conditions = const []});
}
