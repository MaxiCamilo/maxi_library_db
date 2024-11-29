import 'dart:developer';

import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';
import 'package:maxi_library_db/src/tools/database_entity_operator/database_entity_operator_editor.dart';
import 'package:maxi_library_db/src/tools/database_entity_operator/database_entity_operator_querys.dart';

class DatabaseEntityOperator<T> with StartableFunctionality {
  final IDataBaseEngineCapabilities engine;
  final String tableName;

  final bool createTableIfNotExists;
  final List<ForeignKey> foreignKeys;
  final List<IConditionQuery> limits;

  late final ITypeEntityReflection _reflector;

  late final DatabaseEntityOperatorQuerys<T> _querys;
  late final DatabaseEntityOperatorEditor<T> _editor;

  DatabaseEntityOperatorQuerys<T> get querys => checkFirstIfInitialized(() => _querys);
  DatabaseEntityOperatorEditor<T> get editor => checkFirstIfInitialized(() => _editor);

  DatabaseEntityOperator({
    required this.engine,
    required this.tableName,
    this.createTableIfNotExists = true,
    this.foreignKeys = const [],
    this.limits = const [],
  });

  @override
  Future<void> initializeFunctionality() async {
    _reflector = ReflectionManager.getReflectionEntity(T);

    final newOperator = _generateTableOperator(_reflector);
    await newOperator.initialize();

    _querys = DatabaseEntityOperatorQuerys<T>(reflector: _reflector, tableOperator: newOperator);
    _editor = DatabaseEntityOperatorEditor<T>(query: _querys, reflector: _reflector, tableOperator: newOperator);
  }

  DatabaseTableOperator _generateTableOperator(ITypeEntityReflection reflector) {
    final columns = <ColumnAttributes>[];
    for (final field in reflector.fields.where((x) => !x.isStatic)) {
      final posibleGenerator = ReflectionManager.tryGetPrimitiveAdapter(field.reflectedType.type, annotations: field.annotations);

      if (posibleGenerator == null) {
        log('[DANGER!] The field ${field.name} is not a primitive data type');
        continue;
      }

      final newColumn = ColumnAttributes.fromDartType(
        nameColumn: field.name,
        type: posibleGenerator,
        isPrimaryKey: field.annotations.any((x) => x is PrimaryKey),
        isUniqueKey: field.annotations.any((x) => x is UniqueProperty),
      );
      columns.add(newColumn);
    }

    return DatabaseTableOperator(
      engine: engine,
      columns: columns,
      tableName: tableName,
      createTableIfNotExists: createTableIfNotExists,
      foreignKeys: foreignKeys,
      limits: limits,
    );
  }
}
