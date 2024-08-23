import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
abstract class DataBaseEngineTemplate with IDataBaseEngineCapabilities, IDataBaseEngine {
  final _synchronizerEngine = Semaphore();

  bool get inTransaction;

  Future<void> createTransaction();
  Future<void> commitTransaction();
  Future<void> rollbackTransaction();
  Future<void> prepareEngine();
  Future<void> releaseEngine();

  @override
  Future<bool> checkTableExists({required String tableName}) {
    return reserveEngine(function: (_) => checkTableExistsDirectly(tableName: tableName));
  }

  Future<bool> checkTableExistsDirectly({required String tableName});

  @override
  Future<void> deleteTable({required String tableName}) {
    return reserveEngine(function: (_) => deleteTableDirectly(tableName: tableName));
  }

  Future<void> deleteTableDirectly({required String tableName});

  @override
  Future<void> executeCommand({required IDataBaseCommand command}) {
    return reserveEngine(function: (_) => executeCommandDirectly(command: command));
  }

  Future<void> executeCommandDirectly({required IDataBaseCommand command});

  @override
  Future<TableResult> executeQuery({required QueryCommand command}) {
    return reserveEngine(function: (_) => executeQueryDirectly(command: command));
  }

  Future<TableResult> executeQueryDirectly({required QueryCommand command});

  @override
  Future<void> executeFunctionAsTransaction({required Future<bool> Function(IDataBaseEngineCapabilities) function}) {
    return reserveEngine(function: (x) async {
      await executeFunctionAsTransactionDirectly(function: function);
    });
  }

  Future<bool> executeFunctionAsTransactionDirectly({required Future<bool> Function(IDataBaseEngineCapabilities) function}) async {
    await createTransaction();
    try {
      final isCommit = await function(_DataBaseEngineTemplateReserved(baseEngine: this));
      if (isCommit) {
        await commitTransaction();
      } else {
        await rollbackTransaction();
      }
      return isCommit;
    } catch (_) {
      await rollbackTransaction();
      rethrow;
    }
  }

  @override
  Future<TableResult?> executeQueryAsTransaction({required Future<TableResult?> Function(IDataBaseEngineCapabilities p1) function}) {
    return reserveEngine(function: (x) async {
      await createTransaction();
      try {
        final result = await function(_DataBaseEngineTemplateReserved(baseEngine: this));
        await commitTransaction();
        return result;
      } catch (_) {
        await rollbackTransaction();
        rethrow;
      }
    });
  }

  @override
  Future<List<String>> getTableColumnsName({required String tableName}) {
    return reserveEngine(function: (_) => getTableColumnsNameDirectly(tableName: tableName));
  }

  Future<List<String>> getTableColumnsNameDirectly({required String tableName});

  @override
  Future<T> reserveEngine<T>({required Future<T> Function(IDataBaseEngineCapabilities p1) function}) {
    return _synchronizerEngine.execute(function: () async {
      await prepareEngine();
      try {
        return await function(_DataBaseEngineTemplateReserved(baseEngine: this));
      } finally {
        await releaseEngine();
      }
    });
  }
}

class _DataBaseEngineTemplateReserved with IDataBaseEngineCapabilities {
  final DataBaseEngineTemplate baseEngine;

  const _DataBaseEngineTemplateReserved({required this.baseEngine});

  @override
  Future<void> executeCommand({required IDataBaseCommand command}) => baseEngine.executeCommandDirectly(command: command);

  @override
  Future<TableResult> executeQuery({required QueryCommand command}) => baseEngine.executeQueryDirectly(command: command);
  @override
  Future<bool> checkTableExists({required String tableName}) => baseEngine.checkTableExistsDirectly(tableName: tableName);

  @override
  Future<void> deleteTable({required String tableName}) => baseEngine.deleteTableDirectly(tableName: tableName);

  @override
  Future<List<String>> getTableColumnsName({required String tableName}) => baseEngine.getTableColumnsNameDirectly(tableName: tableName);

  @override
  Future<T> reserveEngine<T>({required Future<T> Function(IDataBaseEngineCapabilities p1) function}) => function(this);

  @override
  Future<void> executeFunctionAsTransaction({required Future<bool> Function(IDataBaseEngineCapabilities p1) function}) async {
    if (baseEngine.inTransaction) {
      final isCommit = await function(this);
      if (!isCommit) {
        await baseEngine.rollbackTransaction();
        await baseEngine.createTransaction();
      }
    } else {
      await baseEngine.executeFunctionAsTransactionDirectly(function: function);
    }
  }

  @override
  Future<TableResult?> executeQueryAsTransaction({required Future<TableResult?> Function(IDataBaseEngineCapabilities p1) function}) {
    if (baseEngine.inTransaction) {
      return function(this);
    } else {
      return baseEngine.executeQueryAsTransaction(function: function);
    }
  }
}
