import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

mixin TableOperatorInit {
  static Future<void> initOperator(TableOperator parent) async {
    if (await parent.engine.checkTableExists(tableName: parent.tableName)) {
      await _checkColumnNamesInTable(parent);
    } else {
      if (parent.createTableIfNotExists) {
        await _createTable(parent);
      } else {
        throw NegativeResult(
          identifier: NegativeResultCodes.contextInvalidFunctionality,
          message: trc('Table %1 not exists', [parent.tableName]),
        );
      }
    }
  }

  static Future<void> _checkColumnNamesInTable(TableOperator parent) async {
    final existingColumn = (await parent.engine.getTableColumnsName(tableName: parent.tableName)).toList();

    for (final field in parent.columns) {
      if (!existingColumn.any((x) => x == field.nameColumn)) {
        throw NegativeResult(
          identifier: NegativeResultCodes.contextInvalidFunctionality,
          message: trc('The table %1 does not possess a column named %2', [parent.tableName, field.nameColumn]),
        );
      }
      existingColumn.remove(field.nameColumn);
    }

    if (existingColumn.isNotEmpty) {
      throw NegativeResult(
        identifier: NegativeResultCodes.contextInvalidFunctionality,
        message: trc(
            'The table %1 has %2 extra columns, it cannot be used with the current context (the columns are %3)', [parent.tableName, existingColumn.length, TextUtilities.generateCommand(list: existingColumn)]),
      );
    }
  }

  static Future<void> _createTable(TableOperator parent) async {
    final command = CreateTableCommand(
      name: parent.tableName,
      columns: parent.columns,
      primaryKeyGroups: parent.primaryKeyGroups,
      uniqueKeyGroups: parent.uniqueKeyGroups,
      foreignKeys: parent.foreignKeys,
    );

    await parent.engine.executeCommand(command: command);
  }
}
