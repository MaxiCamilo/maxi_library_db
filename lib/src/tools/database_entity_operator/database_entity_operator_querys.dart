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
        message: Oration(message: 'No item with the identifier %1 was found in the table'),
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
}
