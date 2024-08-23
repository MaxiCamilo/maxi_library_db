import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
class CreateTableCommand with IDataBaseCommand {
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
