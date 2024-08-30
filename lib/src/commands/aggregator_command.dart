import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
class AggregatorCommand with IDataBaseCommand {
  final String tableName;
  final Map<String, dynamic> dataField;

  const AggregatorCommand({required this.tableName, required this.dataField});
}
