import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

class DatabaseEntityOperatorQuerys<T> {
  final ITypeEntityReflection _reflector;
  final DatabaseTableOperator _tableOperator;

  const DatabaseEntityOperatorQuerys({
    required ITypeEntityReflection reflector,
    required DatabaseTableOperator tableOperator,
  })  : _reflector = reflector,
        _tableOperator = tableOperator;

  Future<List<Map<String, dynamic>>> rawQuery({
    List<QueryField> selectedFields = const [],
    List<IConditionQuery> conditions = const [],
    List<QueryJoiner> joins = const [],
    int? minimun,
    int? maximum,
    int? limit,
    DatabaseTableOperatorOrderType order = DatabaseTableOperatorOrderType.none,
  }) =>
      _tableOperator.querys.getValues(selectedFields: selectedFields, conditions: conditions, joins: joins, limit: limit, maximum: maximum, minimun: minimun);

  Future<List<T>> getValues({
    List<IConditionQuery> conditions = const [],
    int? minimun,
    int? maximum,
    int? limit,
    String? identifierColumn,
    DatabaseTableOperatorOrderType order = DatabaseTableOperatorOrderType.none,
    bool verify = true,
  }) async {
    final receivedMap = await _tableOperator.querys.getValues(
      conditions: conditions,
      minimun: minimun,
      maximum: maximum,
      identifierColumn: identifierColumn,
      limit: limit,
      order: order,
    );

    return _reflector.interpretAslist<T>(value: receivedMap, verify: verify, tryToCorrectNames: false);
  }

  Future<T?> getOneValue({
    List<IConditionQuery> conditions = const [],
    bool verify = true,
    int? minimun,
    int? maximum,
    String? identifierColumn,
  }) async {
    final receivedMap = await _tableOperator.querys.getValues(
      conditions: conditions,
      minimun: minimun,
      maximum: maximum,
      identifierColumn: identifierColumn,
      limit: 1,
    );

    if (receivedMap.isEmpty) {
      return null;
    }

    final list = _reflector.interpretAslist<T>(value: receivedMap.first, verify: verify, tryToCorrectNames: false);

    return list.first;
  }

  Future<T?> getByIdentifierOptional({
    required int identifier,
    bool verify = true,
  }) async {
    final receivedMap = await _tableOperator.querys.getValues(
      conditions: [CompareValue(originField: _tableOperator.nameOnlyOnePrimaryKey, value: identifier)],
    );

    final list = _reflector.interpretAslist<T>(value: receivedMap, verify: verify, tryToCorrectNames: false);
    checkProgrammingFailure(thatChecks: Oration(message: 'Only returns one or zero items'), result: () => list.length < 2);

    return list.isEmpty ? null : list.first;
  }

  Future<T> getByIdentifier({
    required int identifier,
    bool verify = true,
  }) async {
    final item = await getByIdentifierOptional(identifier: identifier, verify: verify);
    if (item == null) {
      throw NegativeResult(
        identifier: NegativeResultCodes.nonExistent,
        message: Oration(message: 'No item with the identifier %1 was found in the table', textParts: [identifier]),
      );
    } else {
      return item;
    }
  }

  Stream<List<T>> streamValues({
    List<IConditionQuery> conditions = const [],
    int? maximum,
    int minimun = 0,
    int range = 250,
    String? identifierColumn,
    bool isAscendant = true,
    bool verify = true,
  }) {
    return _tableOperator.querys
        .streamValues(
          conditions: conditions,
          maximum: maximum,
          minimun: minimun,
          range: range,
          identifierColumn: identifierColumn,
          isAscendant: isAscendant,
        )
        .map((x) => _reflector.interpretAslist<T>(value: x, verify: verify, tryToCorrectNames: false));
  }

  Future<List<int>> getIdentifier({
    List<IConditionQuery> conditions = const [],
    int? minimun,
    int? maximum,
    int? limit,
    String? identifierColumn,
    DatabaseTableOperatorOrderType order = DatabaseTableOperatorOrderType.none,
  }) =>
      _tableOperator.querys.getIdentifier(
        conditions: conditions,
        identifierColumn: identifierColumn,
        limit: limit,
        maximum: maximum,
        minimun: minimun,
        order: order,
      );

  Future<int> getLength({
    List<IConditionQuery> conditions = const [],
  }) =>
      _tableOperator.querys.getLength(conditions: conditions);

  Future<bool> any({
    List<IConditionQuery> conditions = const [],
  }) =>
      _tableOperator.querys.any(conditions: conditions);

  Future<int> getMinimumIdentifier({
    List<IConditionQuery> conditions = const [],
    String? identifierColumn,
  }) =>
      _tableOperator.querys.getMinimumIdentifier(conditions: conditions, identifierColumn: identifierColumn);

  Future<int> getMaximumIdentifier({
    List<IConditionQuery> conditions = const [],
    String? identifierColumn,
  }) =>
      _tableOperator.querys.getMaximumIdentifier(conditions: conditions, identifierColumn: identifierColumn);

  Future<List<T>> getDeterminateValues({
    required List values,
    String? identifierColumn,
    bool verify = true,
  }) async {
    final receivedMap = await _tableOperator.querys.getDeterminateValues(
      values: values,
      identifierColumn: identifierColumn,
    );

    return _reflector.interpretAslist<T>(value: receivedMap, verify: verify, tryToCorrectNames: false);
  }

  Future<List<T>> getDeterminateValuesViaID({
    required List<int> identifiers,
    bool verify = true,
    bool everyoneMustBeThere = true,
  }) async {
    final result = await getValues(conditions: [CompareIncludesValues(fieldName: _reflector.primaryKey.name, options: identifiers)]);

    if (everyoneMustBeThere && identifiers.length != result.length) {
      final nonExists = identifiers.where((x) => !result.any((y) => _reflector.getPrimaryKey(instance: y) == x)).toList();

      throw NegativeResult(
        identifier: NegativeResultCodes.nonExistent,
        message: Oration(
          message: 'The database request was expected to yield %1 items, but only %2 item(s) were returned (e.g., %3 are missing...)',
          textParts: [identifiers.length, result.length, nonExists.extractFrom(0, 5).join(',')],
        ),
      );
    }

    return result;
  }

  Stream<List<int>> streamIdentifiers({
    int? maximum,
    int minimun = 0,
    int range = 250,
    bool isAscendant = true,
  }) =>
      _tableOperator.querys.streamValues(
        selectedFields: [QueryField(fieldName: _reflector.primaryKey.name)],
      ).map((x) => x
          .map<int>(
            (y) => (y.values.first as num).toInt(),
          )
          .toList());

  Stream<Map<int, bool>> checkWhichIdentifiersExist({required List<int> identifier, int range = 1000}) async* {
    for (final part in identifier.splitIntoParts(range)) {
      final newMap = <int, bool>{};
      final table = await getIdentifier(conditions: [CompareIncludesValues(fieldName: _reflector.primaryKey.name, options: part)]);
      for (final id in part) {
        newMap[id] = table.contains(id);
      }

      yield newMap;
    }
  }

  Future<Map<int, bool>> checkWhichIdentifiersExistMap({required List<int> identifier, int range = 1000}) async {
    final map = <int, bool>{};

    await for (final part in checkWhichIdentifiersExist(identifier: identifier, range: range)) {
      map.addAll(part);
    }

    return map;
  }

  Future<(List<T>, List<T>)> makeListCategorizedByExistant({required List<T> items, int range = 1000}) async {
    final existing = <T>[];
    final inexistent = <T>[];

    for (final part in items.splitIntoParts(range)) {
      final status = await checkWhichIdentifiersExistMap(identifier: ReflectionManager.getIdentifierList(part), range: range);
      for (final item in part) {
        if (status[ReflectionManager.getIdentifier(item)] == true) {
          existing.add(item);
        } else {
          inexistent.add(item);
        }
      }
    }

    return (existing, inexistent);
  }

  Future<(List<T>, List<int>)> categorizeExistingIdentifiers({required List<int> identifiers, int range = 1000}) async {
    final existing = <T>[];
    final inexistent = <int>[];

    for (final part in identifiers.splitIntoParts(range)) {
      final existingID = <int>[];
      final status = await checkWhichIdentifiersExistMap(identifier: part, range: range);
      for (final item in part) {
        if (status[ReflectionManager.getIdentifier(item)] == true) {
          existingID.add(item);
        } else {
          inexistent.add(item);
        }
      }

      existing.addAll(await getDeterminateValuesViaID(identifiers: existingID));
    }

    return (existing, inexistent);
  }

  Future<Map<int, dynamic>> getColumnValues({
    required String columnName,
    List<IConditionQuery> conditions = const [],
    List<QueryJoiner> joins = const [],
    List<int>? identifiers,
    int? minimun,
    int? maximum,
    int? limit,
    DatabaseTableOperatorOrderType order = DatabaseTableOperatorOrderType.none,
  }) async {
    final field = _reflector.fields.selectRequiredItem(
      (x) => x.name == columnName,
      Oration(
        message: 'field %1 not found in class %2',
        textParts: [columnName, _reflector.name],
      ),
    );

    final totalConditions = <IConditionQuery>[...conditions];
    if (identifiers != null) {
      totalConditions.add(CompareIncludesValues(fieldName: _reflector.primaryKey.name, options: identifiers));
    }

    final values = await _tableOperator.querys.getValues(
      conditions: totalConditions,
      maximum: maximum,
      minimun: minimun,
      limit: limit,
      joins: joins,
      order: order,
      selectedFields: [
        QueryField(fieldName: _reflector.primaryKey.name),
        QueryField(fieldName: columnName),
      ],
    );

    return values.map((x) => (x[_reflector.primaryKey.name] as int, x[columnName])).map((x) {
      return MapEntry<int, dynamic>(x.$1, field.reflectedType.convertObject(x.$2));
    }).toMap();
  }
}
