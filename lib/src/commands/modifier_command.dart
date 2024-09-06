import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

@reflect
class ModifierCommand with IDataBaseCommand {
  final String tableName;
  final Map<String, dynamic> dataField;
  final List<IConditionQuery> conditions;

  ModifierCommand({required this.tableName, required this.dataField, required this.conditions});
}
