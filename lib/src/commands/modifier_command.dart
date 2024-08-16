import 'package:maxi_library_db/src/commands/interfaces/icondition_query.dart';

class ModifierCommand {
  final String tableName;
  final Map<String, dynamic> fieldData;
  final List<IConditionQuery> conditions;

  ModifierCommand({required this.tableName, required this.fieldData, required this.conditions});
}
