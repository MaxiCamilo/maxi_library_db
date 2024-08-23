import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
class ModifierCommand with IDataBaseCommand{
  final String tableName;
  final Map<String, dynamic> fieldData;
  final List<IConditionQuery> conditions;

  ModifierCommand({required this.tableName, required this.fieldData, required this.conditions});
}
