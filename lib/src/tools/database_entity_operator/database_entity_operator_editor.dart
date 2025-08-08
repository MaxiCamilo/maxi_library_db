import 'dart:convert';

import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

class DatabaseEntityOperatorEditor<T> {
  final ITypeEntityReflection _reflector;
  final DatabaseTableOperator _tableOperator;
  final DatabaseEntityOperatorQuerys<T> _query;

  final _synchronizer = Semaphore();

  late final List<IFieldReflection> _uniqueProperties;

  DatabaseEntityOperatorEditor({
    required ITypeEntityReflection reflector,
    required DatabaseTableOperator tableOperator,
    required DatabaseEntityOperatorQuerys<T> query,
  })  : _reflector = reflector,
        _tableOperator = tableOperator,
        _query = query {
    _uniqueProperties = _reflector.fields.where((x) => x.isUnique).toList();
  }

  void _listValuesToJson(List<Map<String, dynamic>> list) {
    for (final map in list) {
      for (final prop in map.entries.where((x) => x.value is List)) {
        map[prop.key] = json.encode(prop.value);
      }
    }
  }

  Future<void> changeToLatestIdentifier({required T value}) => _synchronizer.execute(function: () => _changeToLatestIdentifierInsured(value: value));

  Future<void> _changeToLatestIdentifierInsured({required T value}) async {
    final newId = await _query.getMaximumIdentifier(conditions: const [], identifierColumn: _reflector.primaryKey.name);
    _reflector.changePrimaryKey(instance: value, newId: newId + 1);
  }

  Future<int> add({required T value, bool verify = true}) => _synchronizer.execute(function: () => _addInsured(value: value, verify: verify));

  Future<int> _addInsured({required T value, bool verify = true}) async {
    if (verify) {
      _reflector.verifyValueDirectly(value: value, parentEntity: null);
    }

    if (_reflector.hasPrimaryKey) {
      if (_reflector.getPrimaryKey(instance: value) == 0) {
        await _changeToLatestIdentifierInsured(value: value);
      } else if ((await _query.checkWhichIdentifiersExist(identifier: [_reflector.getPrimaryKey(instance: value)]).toList()).first.entries.first.value) {
        throw NegativeResult(
          identifier: NegativeResultCodes.contextInvalidFunctionality,
          message: Oration(
            message: 'The aggregation failed because the property "%1" with value "%2" is already associated with a different item',
            textParts: [_reflector.primaryKey.name, _reflector.getPrimaryKey(instance: value)],
          ),
        );
      }
    }

    final mapValue = _reflector.serializeToMap(value);
    _listValuesToJson([mapValue as Map<String, dynamic>]);
    await _tableOperator.editor.add(values: mapValue, checkFields: false);

    if (_reflector.hasPrimaryKey) {
      return _reflector.getPrimaryKey(instance: value);
    } else {
      return 0;
    }
  }

  Future<List<T>> addAll({required List<T> list, bool verify = true}) => _synchronizer.execute(function: () => _addAllInsured(list: list, verify: verify));

  Future<List<T>> _addAllInsured({required List<T> list, bool verify = true}) async {
    if (list.isEmpty) {
      return [];
    }

    if (verify) {
      _checkList(list: list);
    }

    for (final part in list.map((x) => _reflector.getPrimaryKey(instance: x)).where((x) => x > 0).splitIntoParts(1000)) {
      final resultList = await _query.checkWhichIdentifiersExist(identifier: part, range: 1000).toList();
      for (final list in resultList) {
        for (final item in list.entries) {
          if (item.value) {
            throw NegativeResult(
              identifier: NegativeResultCodes.contextInvalidFunctionality,
              message: Oration(
                message: 'The aggregation failed because the property "%1" with value "%2" is already associated with a different item',
                textParts: [_reflector.primaryKey.name, item.key],
              ),
            );
          }
        }
      }
    }

    await _checkUniqueProperties(list);

    if (_reflector.hasPrimaryKey) {
      int? lastId;
      for (final item in list) {
        if (_reflector.getPrimaryKey(instance: item) == 0) {
          lastId ??= await _query.getMaximumIdentifier(conditions: const [], identifierColumn: _reflector.primaryKey.name);
          lastId += 1;
          _reflector.changePrimaryKey(instance: item, newId: lastId);
        }
      }
    }

    final mapValue = list.map((x) => _reflector.serializeToMap(x)).cast<Map<String, dynamic>>().toList();
    _listValuesToJson(mapValue);
    await _tableOperator.editor.addAll(list: mapValue, checkFields: false);

    return list;
  }

  Future<void> _checkUniqueProperties(List<T> list) async {
    for (final pro in _uniqueProperties) {
      for (final item in list) {
        final value = pro.getValue(instance: item);
        final id = _reflector.getPrimaryKey(instance: item);
        final otherID = await _query.anyID(conditions: [
          CompareValue(originField: pro.name, value: value),
          CompareValue(originField: _reflector.primaryKey.name, value: id, typeComparation: ConditionCompareType.notEqual),
        ]);

        if (otherID != null) {
          throw NegativeResult(
            identifier: NegativeResultCodes.contextInvalidFunctionality,
            message: Oration(
              message: 'The item with identifier %1 has the same value for property %2; there cannot be two or more items with the same value',
              textParts: [otherID, pro.formalName],
            ),
          );
        }
      }
    }
  }

  Future<void> assign({required T value, bool verify = true}) => assignAll(list: [value], verify: verify);

  Future<void> assignAll({required List<T> list, bool verify = true}) => _synchronizer.execute(function: () => _assignAllInsured(list: list, verify: verify));

  Future<void> _assignAllInsured({required List<T> list, bool verify = true}) async {
    if (list.isEmpty) {
      return;
    }
    final idLIst = list.map((x) => _reflector.getPrimaryKey(instance: x)).toList();
    final existens = await _query.checkWhichIdentifiersExistMap(identifier: idLIst);

    final toModify = list.where((x) => existens[_reflector.getPrimaryKey(instance: x)]!).toList();
    final toAdd = list.where((x) => !toModify.contains(x)).toList();

    if (toModify.isNotEmpty) {
      await _modifySeveralInsured(list: toModify, verify: verify);
    }

    if (toAdd.isNotEmpty) {
      await _addAllInsured(list: toAdd, verify: verify);
    }
  }

  Future<void> modifySeveral({required List<T> list, bool verify = true}) => _synchronizer.execute(function: () => _modifySeveralInsured(list: list, verify: verify));

  Future<void> _modifySeveralInsured({required List<T> list, bool verify = true}) async {
    if (list.isEmpty) {
      return;
    }

    if (verify) {
      _checkList(list: list);
      _checkIfNotZeroId(list: list);
    }

    for (final part in list.map((x) => _reflector.getPrimaryKey(instance: x)).splitIntoParts(1000)) {
      final resultList = await _query.checkWhichIdentifiersExist(identifier: part, range: 1000).toList();
      for (final list in resultList) {
        for (final item in list.entries) {
          if (!item.value) {
            throw NegativeResult(
              identifier: NegativeResultCodes.contextInvalidFunctionality,
              message: Oration(
                message: 'The modification cannot be performed because property "%1" has "%2" assigned to it, but it does not exist',
                textParts: [_reflector.primaryKey.name, item.key],
              ),
            );
          }
        }
      }
    }

    await _checkUniqueProperties(list);

    final mapValue = list.map((x) => _reflector.serializeToMap(x)).cast<Map<String, dynamic>>().toList();
    _listValuesToJson(mapValue);
    await _tableOperator.editor.modifyAccordingColumn(list: mapValue, checkFields: false, columnName: _reflector.primaryKey.name);
  }

  Future<void> deleteAll() => _synchronizer.execute(function: () => _tableOperator.editor.deleteAll());

  Future<void> deleteSpecifics({required List<int> identifiers}) => _synchronizer.execute(function: () => _deleteSpecificsInsured(identifiers: identifiers));

  Future<void> _deleteSpecificsInsured({required List<int> identifiers}) async {
    for (final part in identifiers.splitIntoParts(1000)) {
      await _tableOperator.editor.deleteAccordingColumn(list: part);
    }
  }

  Future<void> delete({required List<IConditionQuery> conditions}) => _synchronizer.execute(function: () => _deleteInsured(conditions: conditions));

  Future<void> _deleteInsured({required List<IConditionQuery> conditions}) {
    return _tableOperator.editor.delete(conditions: conditions);
  }

  void _checkList({required List<T> list}) {
    int i = 1;
    for (final item in list) {
      volatileFactory(
        negativeFactory: (rn) => NegativeResultValue.fromNegativeResult(nr: rn, value: item, name: (i + 1).toString(), formalName: Oration(message: 'Value number %1', textParts: [i])),
        function: () => _reflector.verifyValueDirectly(value: item, parentEntity: null),
      );
    }
  }

  void _checkIfNotZeroId({required List<T> list}) {
    if (!_reflector.hasPrimaryKey) {
      return;
    }

    int i = 1;

    for (final item in list) {
      final id = _reflector.getPrimaryKey(instance: item);
      if (id <= 0) {
        throw NegativeResultValue(
          identifier: NegativeResultCodes.invalidProperty,
          message: Oration(message: 'The modification cannot be performed because item No. %1 does not have an assigned identifier', textParts: [i]),
          name: (i + 1).toString(),
          formalName: _reflector.primaryKey.formalName,
          value: id,
        );
      }
      i += 1;
    }
  }
}
