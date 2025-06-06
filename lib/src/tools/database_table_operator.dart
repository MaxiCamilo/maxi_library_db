import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';
import 'package:maxi_library_db/src/tools/database_table_operator/database_table_operator_editor.dart';
import 'package:maxi_library_db/src/tools/database_table_operator/database_table_operator_init.dart';
import 'package:maxi_library_db/src/tools/database_table_operator/database_table_operator_querys.dart';

enum DatabaseTableOperatorOrderType { none, ascendant, descendant }

class DatabaseTableOperator with StartableFunctionality {
  final IDataBaseEngineCapabilities engine;
  final String tableName;
  final List<ColumnAttributes> columns;
  final List<QueryJoiner> joins;
  final List<List<String>> primaryKeyGroups;
  final List<List<String>> uniqueKeyGroups;
  final List<ForeignKey> foreignKeys;
  final List<IConditionQuery> limits;

  final bool createTableIfNotExists;

  late final bool _hasOnlyOnePrimaryKey;
  late final String _onePrimaryKey;

  late final DatabaseTableOperatorQuerys _querys;
  late final DatabaseTableOperatorEditor _editor;

  DatabaseTableOperatorQuerys get querys => checkFirstIfInitialized(() => _querys);
  DatabaseTableOperatorEditor get editor => checkFirstIfInitialized(() => _editor);

  String get nameOnlyOnePrimaryKey {
    if (!_hasOnlyOnePrimaryKey) {
      throw NegativeResult(
        identifier: NegativeResultCodes.contextInvalidFunctionality,
        message: primaryKeyGroups.isEmpty
            ? Oration(message: 'Table %1 does not possess an primary key', textParts: [tableName])
            : Oration(message: 'Table %1 does not possess an individual primary key', textParts: [tableName]),
      );
    }

    return _onePrimaryKey;
  }

  DatabaseTableOperator({
    required this.engine,
    required this.tableName,
    required this.columns,
    this.joins = const [],
    this.primaryKeyGroups = const [],
    this.uniqueKeyGroups = const [],
    this.foreignKeys = const [],
    this.limits = const [],
    this.createTableIfNotExists = true,
  }) {
    checkProgrammingFailure(thatChecks: Oration(message: 'A non-empty list of primary keys was required'), result: () => primaryKeyGroups.every((x) => x.isNotEmpty));
    checkProgrammingFailure(thatChecks: Oration(message: 'A non-empty list of unique keys was required'), result: () => uniqueKeyGroups.every((x) => x.isNotEmpty));

    if (primaryKeyGroups.isNotEmpty && primaryKeyGroups.length == 1 && primaryKeyGroups.first.length == 1) {
      _hasOnlyOnePrimaryKey = true;
      _onePrimaryKey = primaryKeyGroups.first.first;
    } else if (columns.count((x) => x.isPrimaryKey) == 1) {
      _hasOnlyOnePrimaryKey = true;
      _onePrimaryKey = columns.firstWhere((x) => x.isPrimaryKey).nameColumn;
    } else {
      _hasOnlyOnePrimaryKey = false;
      _onePrimaryKey = '';
    }
  }

  @override
  Future<void> initializeFunctionality() async {
    await DatabaseTableOperatorInit.initOperator(this);

    _querys = DatabaseTableOperatorQuerys(this);
    _editor = DatabaseTableOperatorEditor(parent: this);
  }

  Map<String, dynamic> convertValue({
    required Map<String, dynamic> values,
    required bool requireAllFields,
    required bool removeNonExistent,
  }) {
    final newMap = <String, dynamic>{};

    if (requireAllFields) {
      for (final col in columns) {
        if (!values.containsKey(col.nameColumn)) {
          throw NegativeResult(
            identifier: NegativeResultCodes.invalidFunctionality,
            message: Oration(message: 'The field %1 is required for table %2, but was not defined in the values', textParts: [col.nameColumn, tableName]),
          );
        }
      }
    }

    for (final item in values.entries.toList()) {
      final column = columns.selectItem((x) => x.nameColumn == item.key);
      if (column == null) {
        if (removeNonExistent) {
          values.remove(item.key);
        } else {
          throw NegativeResult(
            identifier: NegativeResultCodes.invalidFunctionality,
            message: Oration(message: 'The table %1 does not contains the column named %2', textParts: [tableName, item.key]),
          );
        }
        continue;
      } else {
        newMap[item.key] = column.valueAdapter.convertToPrimitiveValue(item.value);
      }
    }

    return newMap;
  }
}
