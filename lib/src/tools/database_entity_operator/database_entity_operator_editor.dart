import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';
import 'package:maxi_library_db/src/tools/database_entity_operator/database_entity_operator_querys.dart';

class DatabaseEntityOperatorEditor<T> {
  final ITypeEntityReflection _reflector;
  final DatabaseTableOperator _tableOperator;
  final DatabaseEntityOperatorQuerys<T> _query;

  const DatabaseEntityOperatorEditor({
    required ITypeEntityReflection reflector,
    required DatabaseTableOperator tableOperator,
    required DatabaseEntityOperatorQuerys<T> query,
  })  : _reflector = reflector,
        _tableOperator = tableOperator,
        _query = query;

  Future<void> changeToLatestIdentifier({required T value}) async {
    final newId = await _query.getMaximumIdentifier(conditions: const [], identifierColumn: _reflector.primaryKey.name);
    _reflector.changePrimaryKey(instance: value, newId: newId + 1);
  }

  Future<void> add({required T value, bool verify = true}) async {
    if (verify) {
      _reflector.verifyValueDirectly(value: value, parentEntity: null);
    }

    if (_reflector.hasPrimaryKey) {
      if (_reflector.getPrimaryKey(instance: value) == 0) {
        await changeToLatestIdentifier(value: value);
      } else if ((await _query.checkWhichIdentifiersExist(identifier: [_reflector.getPrimaryKey(instance: value)]).toList()).first.entries.first.value) {
        throw NegativeResult(
          identifier: NegativeResultCodes.contextInvalidFunctionality,
          message: tr(
            'The aggregation failed because the property "%1" with value "%2" is already associated with a different item',
            [_reflector.primaryKey.name, _reflector.getPrimaryKey(instance: value)],
          ),
        );
      }
    }

    final mapValue = _reflector.serializeToMap(value);
    return _tableOperator.editor.add(values: mapValue, checkFields: false);
  }

  Future<void> addAll({required List<T> list, bool verify = true}) async {
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
              message: tr(
                'The aggregation failed because the property "%1" with value "%2" is already associated with a different item',
                [_reflector.primaryKey.name, item.key],
              ),
            );
          }
        }
      }
    }

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
    return _tableOperator.editor.addAll(list: mapValue, checkFields: false);
  }

  Future<void> modifySeveral({required List<T> list, bool verify = true}) async {
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
              message: tr(
                'The modification cannot be performed because property "%1" has "%2" assigned to it, but it does not exist',
                [_reflector.primaryKey.name, item.key],
              ),
            );
          }
        }
      }
    }

    final mapValue = list.map((x) => _reflector.serializeToMap(x)).cast<Map<String, dynamic>>().toList();
    return _tableOperator.editor.modifyAccordingColumn(list: mapValue, checkFields: false, columnName: _reflector.primaryKey.name);
  }

  Future<void> deleteAll() => _tableOperator.editor.deleteAll();

  Future<void> deleteSpecifics({required List<int> identifiers}) async {
    for (final part in identifiers.splitIntoParts(1000)) {
      await _tableOperator.editor.deleteAccordingColumn(list: part);
    }
  }

  void _checkList({required List<T> list}) {
    int i = 1;
    for (final item in list) {
      volatileFactory(
        negativeFactory: (rn) => NegativeResultValue.fromNegativeResult(nr: rn, value: item, name: tr('Value number %1', [i])),
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
          message: tr('The modification cannot be performed because item No. %1 does not have an assigned identifier', [i]),
          name: tr( _reflector.primaryKey.name),
          value: id,
        );
      }
      i += 1;
    }
  }
}
