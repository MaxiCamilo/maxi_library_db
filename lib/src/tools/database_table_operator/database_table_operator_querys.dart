import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

class DatabaseTableOperatorQuerys {
  final DatabaseTableOperator parent;

  const DatabaseTableOperatorQuerys(this.parent);

  Future<List<Map<String, dynamic>>> getValues({
    List<QueryField> selectedFields = const [],
    List<IConditionQuery> conditions = const [],
    List<QueryJoiner> joins = const [],
    int? minimun,
    int? maximum,
    int? limit,
    String? identifierColumn,
    DatabaseTableOperatorOrderType order = DatabaseTableOperatorOrderType.none,
  }) async {
    final allConditions = [...parent.limits, ...conditions];

    if (minimun != null) {
      identifierColumn ??= parent.nameOnlyOnePrimaryKey;
      allConditions.add(CompareValue(originField: identifierColumn, value: minimun, typeComparation: ConditionCompareType.greaterEqual));
    }

    if (maximum != null) {
      identifierColumn ??= parent.nameOnlyOnePrimaryKey;
      allConditions.add(CompareValue(originField: identifierColumn, value: maximum, typeComparation: ConditionCompareType.lessEqual));
    }

    final orderQuery = <QueryOrder>[];
    if (order == DatabaseTableOperatorOrderType.ascendant || order == DatabaseTableOperatorOrderType.descendant) {
      identifierColumn ??= parent.nameOnlyOnePrimaryKey;
      orderQuery.add(QueryOrder(fields: [identifierColumn], isAscendent: order == DatabaseTableOperatorOrderType.ascendant));
    }

    final command = QueryCommand(
      selectedFields: selectedFields,
      selectedTables: [QueryTable(fieldName: parent.tableName)],
      conditions: allConditions,
      orders: orderQuery,
      joinedTables: [...parent.joins, ...joins],
      limit: limit,
    );

    final result = await parent.engine.executeQuery(command: command);
    return result.toList();
  }

  Stream<List<Map<String, dynamic>>> streamValues({
    List<QueryField> selectedFields = const [],
    List<IConditionQuery> conditions = const [],
    List<QueryJoiner> joins = const [],
    int? maximum,
    int minimun = 0,
    int range = 250,
    String? identifierColumn,
    bool isAscendant = true,
  }) async* {
    identifierColumn ??= parent.nameOnlyOnePrimaryKey;

    if (isAscendant) {
      while (true) {
        final content = await getValues(
          conditions: conditions,
          identifierColumn: identifierColumn,
          joins: joins,
          limit: range,
          minimun: minimun,
          maximum: maximum,
          order: DatabaseTableOperatorOrderType.ascendant,
          selectedFields: selectedFields,
        );

        if (content.isEmpty) {
          break;
        }

        minimun = content.map((x) => x[identifierColumn]!).maximumOf((x) => (x as num).toInt()) + 1;
        yield content;

        if (maximum != null && minimun >= maximum) {
          break;
        }
      }
    } else {
      maximum ??= await getMaximumIdentifier(conditions: conditions, identifierColumn: identifierColumn);
      while (true) {
        final content = await getValues(
          conditions: conditions,
          identifierColumn: identifierColumn,
          joins: joins,
          limit: range,
          minimun: minimun,
          maximum: maximum,
          order: DatabaseTableOperatorOrderType.descendant,
          selectedFields: selectedFields,
        );

        if (content.isEmpty) {
          break;
        }

        maximum = content.map((x) => x[identifierColumn]!).minimumOf((x) => (x as num).toInt()) - 1;
        yield content;

        if (maximum! <= minimun) {
          break;
        }
      }
    }
  }

  Future<List<int>> getIdentifier({
    List<IConditionQuery> conditions = const [],
    int? minimun,
    int? maximum,
    int? limit,
    String? identifierColumn,
    DatabaseTableOperatorOrderType order = DatabaseTableOperatorOrderType.none,
  }) async {
    final allConditions = [...parent.limits, ...conditions];
    identifierColumn ??= parent.nameOnlyOnePrimaryKey;

    if (minimun != null) {
      allConditions.add(CompareValue(originField: identifierColumn, value: minimun, typeComparation: ConditionCompareType.greaterEqual));
    }

    if (maximum != null) {
      allConditions.add(CompareValue(originField: identifierColumn, value: maximum, typeComparation: ConditionCompareType.lessEqual));
    }

    final orderQuery = <QueryOrder>[];
    if (order == DatabaseTableOperatorOrderType.ascendant || order == DatabaseTableOperatorOrderType.descendant) {
      orderQuery.add(QueryOrder(fields: [identifierColumn], isAscendent: order == DatabaseTableOperatorOrderType.ascendant));
    }

    final command = QueryCommand(
      selectedFields: [QueryField(fieldName: identifierColumn)],
      selectedTables: [QueryTable(fieldName: parent.tableName)],
      orders: orderQuery,
      conditions: allConditions,
      limit: limit,
    );

    final result = await parent.engine.executeQuery(command: command);
    if (result.isEmpty) {
      return <int>[];
    }

    return result.getColumnContentByPosition(position: 0).map((x) => (x as num).toInt()).toList();
  }

  Future<int> getLength({
    List<IConditionQuery> conditions = const [],
  }) async {
    final result = await getValues(
      selectedFields: [QueryField(fieldName: parent.nameOnlyOnePrimaryKey, type: QueryFieldType.count)],
      conditions: conditions,
      joins: const [],
      minimun: null,
      maximum: null,
      limit: 1,
      identifierColumn: null,
      order: DatabaseTableOperatorOrderType.none,
    );

    if (result.isEmpty) {
      return 0;
    }

    checkProgrammingFailure(
      thatChecks: Oration(message: 'The result of the length query returned only one item'),
      result: () => result.length == 1 && result.first.length == 1,
    );

    return (result.first.values.first as num).toInt();
  }

  Future<int> getMinimumIdentifier({
    List<IConditionQuery> conditions = const [],
    String? identifierColumn,
  }) async {
    final result = await getValues(
      selectedFields: [QueryField(fieldName: parent.nameOnlyOnePrimaryKey, type: QueryFieldType.minimum)],
      conditions: conditions,
      joins: const [],
      minimun: null,
      maximum: null,
      limit: 1,
      identifierColumn: identifierColumn,
      order: DatabaseTableOperatorOrderType.none,
    );

    if (result.isEmpty || result.first.values.first == null) {
      return 0;
    }

    checkProgrammingFailure(
      thatChecks: Oration(message: 'The result of the minimum identifier query returned only one item'),
      result: () => result.length == 1 && result.first.length == 1,
    );

    return (result.first.values.first as num).toInt();
  }

  Future<int> getMaximumIdentifier({
    required List<IConditionQuery> conditions,
    required String? identifierColumn,
  }) async {
    final result = await getValues(
      selectedFields: [QueryField(fieldName: parent.nameOnlyOnePrimaryKey, type: QueryFieldType.maximum)],
      conditions: conditions,
      joins: const [],
      minimun: null,
      maximum: null,
      limit: 1,
      identifierColumn: identifierColumn,
      order: DatabaseTableOperatorOrderType.none,
    );

    if (result.isEmpty || result.first.values.first == null) {
      return 0;
    }

    checkProgrammingFailure(
      thatChecks: Oration(message: 'The result of the maximum identifier query returned only one item'),
      result: () => result.length == 1 && result.first.length == 1,
    );

    return (result.first.values.first as num).toInt();
  }

  Future<List<Map<String, dynamic>>> getDeterminateValues({
    required List values,
    List<QueryField> selectedFields = const [],
    String? identifierColumn,
  }) async {
    return getValues(
      selectedFields: selectedFields,
      conditions: [
        CompareIncludesValues(fieldName: identifierColumn ?? parent.nameOnlyOnePrimaryKey, options: values),
      ],
      joins: [],
      minimun: null,
      maximum: null,
      limit: null,
      identifierColumn: identifierColumn,
      order: DatabaseTableOperatorOrderType.none,
    );
  }
}
