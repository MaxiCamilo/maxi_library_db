import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

class DatabaseTableOperatorEditor {
  final DatabaseTableOperator parent;

  const DatabaseTableOperatorEditor({required this.parent});

  void _checkPropertyExitst(String? propertyName) {
    if (propertyName != null && !parent.columns.any((x) => x.nameColumn == propertyName)) {
      throw NegativeResult(
        identifier: NegativeResultCodes.nonExistent,
        message: tr('The table %1 does not contain property %2', [parent.tableName, propertyName]),
      );
    }
  }

  Future<void> add({required Map<String, dynamic> values, bool checkFields = true}) {
    if (checkFields) {
      values = parent.convertValue(values: values, requireAllFields: true, removeNonExistent: true);
    }

    return parent.engine.executeFunctionAsTransaction(function: (engine) async {
      await engine.executeCommand(
        command: AggregatorCommand(
          tableName: parent.tableName,
          dataField: values,
        ),
      );
      return true;
    });
  }

  Future<void> addAll({required List<Map<String, dynamic>> list, bool checkFields = true}) {
    if (checkFields) {
      final clon = list.toList(growable: false);
      list = <Map<String, dynamic>>[];
      for (final value in clon) {
        final item = parent.convertValue(values: value, requireAllFields: true, removeNonExistent: true);
        list.add(item);
      }
    }

    return parent.engine.executeFunctionAsTransaction(function: (engine) async {
      for (final values in list) {
        await engine.executeCommand(
          command: AggregatorCommand(
            tableName: parent.tableName,
            dataField: values,
          ),
        );
      }
      return true;
    });
  }

  Future<void> modifySeveral({required List<Map<String, dynamic>> list, required List<IConditionQuery> conditions, bool checkFields = true}) {
    if (checkFields) {
      final clon = list.toList(growable: false);
      list = <Map<String, dynamic>>[];
      for (final value in clon) {
        final item = parent.convertValue(values: value, requireAllFields: true, removeNonExistent: true);
        list.add(item);
      }
    }

    return parent.engine.executeFunctionAsTransaction(function: (engine) async {
      for (final values in list) {
        await engine.executeCommand(
          command: ModifierCommand(
            tableName: parent.tableName,
            dataField: values,
            conditions: [...conditions, ...parent.limits],
          ),
        );
      }
      return true;
    });
  }

  Future<void> modifyAccordingColumn({
    required List<Map<String, dynamic>> list,
    String? columnName,
    List<IConditionQuery> extraConditions = const [],
    bool checkFields = true,
  }) {
    _checkPropertyExitst(columnName);
    columnName ??= parent.nameOnlyOnePrimaryKey;

    if (checkFields) {
      int i = 1;
      final clon = list.toList(growable: false);
      list = <Map<String, dynamic>>[];

      for (final value in clon) {
        final converted = parent.convertValue(values: value, requireAllFields: false, removeNonExistent: true);
        if (!value.containsKey(columnName)) {
          throw NegativeResult(
            identifier: NegativeResultCodes.nonExistent,
            message: tr('The item located at %1 was not defined the property named %2', [i, columnName]),
          );
        }

        list.add(converted);
        i += 1;
      }
    }

    return parent.engine.executeFunctionAsTransaction(function: (engine) async {
      for (final values in list) {
        await engine.executeCommand(
          command: ModifierCommand(
            tableName: parent.tableName,
            dataField: values,
            conditions: [CompareValue(originField: columnName!, value: values[columnName]), ...extraConditions, ...parent.limits],
          ),
        );
      }
      return true;
    });
  }

  Future<void> delete({required List<IConditionQuery> conditions}) {
    return parent.engine.executeFunctionAsTransaction(function: (engine) async {
      await engine.executeCommand(
        command: DeleteCommand(
          tableName: parent.tableName,
          conditions: [...conditions, ...parent.limits],
        ),
      );
      return true;
    });
  }

  Future<void> deleteAll() => delete(conditions: const []);

  Future<void> deleteAccordingColumn({
    required List<dynamic> list,
    String? columnName,
    List<IConditionQuery> extraConditions = const [],
  }) {
    _checkPropertyExitst(columnName);
    columnName ??= parent.nameOnlyOnePrimaryKey;

    return parent.engine.executeFunctionAsTransaction(function: (engine) async {
      await engine.executeCommand(
        command: DeleteCommand(
          tableName: parent.tableName,
          conditions: [
            CompareIncludesValues(fieldName: columnName!, options: list),
            ...extraConditions,
            ...parent.limits,
          ],
        ),
      );
      return true;
    });
  }
}
