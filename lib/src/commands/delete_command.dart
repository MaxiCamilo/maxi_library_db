import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

@reflect
class DeleteCommand with IDataBaseCommand {
  final String tableName;
  final List<IConditionQuery> conditions;

  const DeleteCommand({required this.tableName, this.conditions = const []});
}
