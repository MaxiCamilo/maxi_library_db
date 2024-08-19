import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

abstract class TemplateDatabaseEngine with IDatabaseEngineCapabilities, IDatabaseEngine {
  final _synchronizer = Semaphore();

  Future<void> createTransaction();
  Future<void> commitTransaction();
  Future<void> rollbackTransaction();

  @override
  Future<bool> checkTableExists({required String tableName}) {
    return _synchronizer.execute(function: () => checkTableExistsDirectly(tableName: tableName));
  }

  Future<bool> checkTableExistsDirectly({required String tableName});

  @override
  Future<void> deleteTable({required String tableName}) {
    return _synchronizer.execute(function: () => deleteTableDirectly(tableName: tableName));
  }

  Future<void> deleteTableDirectly({required String tableName});

  @override
  Future<void> executeCommand({required IDatabaseCommand command}) {
    return _synchronizer.execute(function: () => executeCommandDirectly(command: command));
  }

  Future<void> executeCommandDirectly({required IDatabaseCommand command});

  @override
  Future<TableResult> executeQuery({required QueryCommand command}) {
    return _synchronizer.execute(function: () => executeQueryDirectly(command: command));
  }

  Future<TableResult> executeQueryDirectly({required QueryCommand command});

  @override
  Future<void> executeCommandAsTransaction({required Future<bool> Function(IDatabaseEngineCapabilities) function}) async {
    await createTransaction();
    try {
      final isCommit = await function(_TemplateDatabaseEngineReserved(baseEngine: this));
      if (isCommit) {
        await commitTransaction();
      } else {
        await rollbackTransaction();
      }
    } catch (_) {
      await rollbackTransaction();
      rethrow;
    }
  }

  @override
  Future<TableResult?> executeQueryAsTransaction({required Future<TableResult?> Function(IDatabaseEngineCapabilities p1) function}) async {
    await createTransaction();
    try {
      final result = await function(_TemplateDatabaseEngineReserved(baseEngine: this));
      await commitTransaction();
      return result;
    } catch (_) {
      await rollbackTransaction();
      rethrow;
    }
  }

  @override
  Future<List<String>> getTableColumnsName({required String tableName}) {
    return _synchronizer.execute(function: () => getTableColumnsNameDirectly(tableName: tableName));
  }

  Future<List<String>> getTableColumnsNameDirectly({required String tableName});

  @override
  Future<void> reserveEngine({required Future<void> Function(IDatabaseEngineCapabilities p1) function}) {
    return _synchronizer.execute(function: () => function(_TemplateDatabaseEngineReserved(baseEngine: this)));
  }
}

class _TemplateDatabaseEngineReserved with IDatabaseEngineCapabilities {
  final TemplateDatabaseEngine baseEngine;

  const _TemplateDatabaseEngineReserved({required this.baseEngine});

  @override
  Future<void> executeCommand({required IDatabaseCommand command}) => baseEngine.executeCommandDirectly(command: command);

  @override
  Future<TableResult> executeQuery({required QueryCommand command}) => baseEngine.executeQueryDirectly(command: command);
  @override
  Future<bool> checkTableExists({required String tableName}) => baseEngine.checkTableExistsDirectly(tableName: tableName);

  @override
  Future<void> deleteTable({required String tableName}) => baseEngine.deleteTableDirectly(tableName: tableName);

  @override
  Future<List<String>> getTableColumnsName({required String tableName}) => baseEngine.getTableColumnsNameDirectly(tableName: tableName);
}
