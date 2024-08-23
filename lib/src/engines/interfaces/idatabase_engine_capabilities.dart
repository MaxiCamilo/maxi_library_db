import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
mixin IDataBaseEngineCapabilities {
  Future<void> executeCommand({required IDataBaseCommand command});
  Future<TableResult> executeQuery({required QueryCommand command});

  Future<List<String>> getTableColumnsName({required String tableName});
  Future<bool> checkTableExists({required String tableName});
  Future<void> deleteTable({required String tableName});

  Future<void> executeFunctionAsTransaction({required Future<bool> Function(IDataBaseEngineCapabilities) function});
  Future<TableResult?> executeQueryAsTransaction({required Future<TableResult?> Function(IDataBaseEngineCapabilities) function});

  Future<T> reserveEngine<T>({required Future<T> Function(IDataBaseEngineCapabilities) function});
}
