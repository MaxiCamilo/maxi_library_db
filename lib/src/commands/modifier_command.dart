import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
class ModifierCommand with IDataBaseCommand {
  final String tableName;
  final Map<String, dynamic> dataField;
  final List<IConditionQuery> conditions;

  ModifierCommand({required this.tableName, required this.dataField, required this.conditions});
}
