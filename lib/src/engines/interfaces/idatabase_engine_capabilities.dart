import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

mixin IDataBaseEngineCapabilities {
  Future<void> executeCommand({required IDataBaseCommand command});
  Future<TableResult> executeQuery({required QueryCommand command});

  Future<List<String>> getTableColumnsName({required String tableName});
  Future<bool> checkTableExists({required String tableName});
  Future<void> deleteTable({required String tableName});
}
