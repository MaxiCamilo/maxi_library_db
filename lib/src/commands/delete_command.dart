import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
class DeleteCommand with IDataBaseCommand{
  final String tableName;
  final List<IConditionQuery> conditions;

  const DeleteCommand({required this.tableName, this.conditions = const []});
}
