import 'package:maxi_library_db/maxi_library_db.dart';
import 'package:maxi_library_db/src/commands/attributes_queries/foreign_key.dart';

class CreateTableCommand {
  final String name;
  final List<ColumnAttributes> columns;
  final List<List<String>> primaryKeyGroups;
  final List<List<String>> uniqueKeyGroups;
  final List<ForeignKey> foreignKeys;

  const CreateTableCommand({
    required this.name,
    required this.columns,
    required this.primaryKeyGroups,
    required this.uniqueKeyGroups,
    required this.foreignKeys,
  });
}
