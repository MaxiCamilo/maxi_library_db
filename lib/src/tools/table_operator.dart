import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';
import 'package:maxi_library_db/src/tools/table_operator/table_operator_editor.dart';
import 'package:maxi_library_db/src/tools/table_operator/table_operator_init.dart';
import 'package:maxi_library_db/src/tools/table_operator/table_operator_querys.dart';

enum TableOperatorOrderType { none, ascendant, descendant }

class TableOperator with StartableFunctionality {
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

  late final TableOperatorQuerys _querys;
  late final TableOperatorEditor _editor;

  TableOperatorQuerys get querys => checkFirstIfInitialized(() => _querys);
  TableOperatorEditor get editor => checkFirstIfInitialized(() => _editor);

  String get nameOnlyOnePrimaryKey {
    if (!_hasOnlyOnePrimaryKey) {
      throw NegativeResult(
        identifier: NegativeResultCodes.contextInvalidFunctionality,
        message: primaryKeyGroups.isEmpty ? trc('Table %1 does not possess an primary key', [tableName]) : trc('Table %1 does not possess an individual primary key', [tableName]),
      );
    }

    return _onePrimaryKey;
  }

  TableOperator({
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
    checkProgrammingFailure(thatChecks: () => tr('A non-empty list of primary keys was required'), result: () => primaryKeyGroups.every((x) => x.isNotEmpty));
    checkProgrammingFailure(thatChecks: () => tr('A non-empty list of unique keys was required'), result: () => uniqueKeyGroups.every((x) => x.isNotEmpty));

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
    await TableOperatorInit.initOperator(this);

    _querys = TableOperatorQuerys(this);
    _editor = TableOperatorEditor(parent: this);
  }

  void checkContentMap({
    required Map<String, dynamic> values,
    required bool requireAllFields,
    required bool removeNonExistent,
    bool checkAllPrimitives = true,
  }) {
    if (checkAllPrimitives) {
      for (final item in values.entries) {
        if (ReflectionUtilities.isPrimitive(item.value) == null) {
          throw NegativeResult(
            identifier: NegativeResultCodes.invalidValue,
            message: trc('The value of %1 is not a primitive data type', [item.key]),
          );
        }
      }
    }

    for (final item in values.entries.toList()) {
      if (!columns.any((x) => x.nameColumn == item.key)) {
        if (removeNonExistent) {
          values.remove(item.key);
        } else {
          throw NegativeResult(
            identifier: NegativeResultCodes.invalidFunctionality,
            message: trc('The table %1 does not contains the column named %2', [tableName, item.key]),
          );
        }
      }
    }

    if (requireAllFields) {
      for (final col in columns) {
        if (!values.containsKey(col.nameColumn)) {
          throw NegativeResult(
            identifier: NegativeResultCodes.invalidFunctionality,
            message: trc('The field %1 is required for table %2, but was not defined in the values', [col.nameColumn, tableName]),
          );
        }
      }
    }
  }
}
