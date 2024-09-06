// ignore_for_file: unnecessary_const, unnecessary_import, duplicate_import, unused_import, invalid_use_of_protected_member

import 'package:maxi_library/export_reflectors.dart';
import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';
import 'dart:typed_data';
import 'package:meta/meta.dart';
import 'package:maxi_library_db/src/tools/database_table_operator/database_table_operator_editor.dart';
import 'package:maxi_library_db/src/tools/database_table_operator/database_table_operator_init.dart';
import 'package:maxi_library_db/src/tools/database_table_operator/database_table_operator_querys.dart';
import 'package:maxi_library_db/src/tools/database_entity_operator/database_entity_operator_querys.dart';
import 'dart:developer';
import 'package:maxi_library_db/src/tools/database_entity_operator/database_entity_operator_editor.dart';

class _QueryFieldTypeEnum extends TypeEnumeratorReflector {
  const _QueryFieldTypeEnum()
      : super(
          type: QueryFieldType,
          name: 'QueryFieldType',
          annotations: const [reflect],
          optionsList: const [
            EnumOption(annotations: const [], value: QueryFieldType.field),
            EnumOption(annotations: const [], value: QueryFieldType.count),
            EnumOption(annotations: const [], value: QueryFieldType.maximum),
            EnumOption(annotations: const [], value: QueryFieldType.minimum),
            EnumOption(annotations: const [], value: QueryFieldType.average),
            EnumOption(annotations: const [], value: QueryFieldType.sum),
          ],
        );
}

class _QueryJoinerTypeEnum extends TypeEnumeratorReflector {
  const _QueryJoinerTypeEnum()
      : super(
          type: QueryJoinerType,
          name: 'QueryJoinerType',
          annotations: const [reflect],
          optionsList: const [
            EnumOption(annotations: const [], value: QueryJoinerType.inner),
            EnumOption(annotations: const [], value: QueryJoinerType.left),
            EnumOption(annotations: const [], value: QueryJoinerType.rigth),
            EnumOption(annotations: const [], value: QueryJoinerType.fullOuter),
          ],
        );
}

class _ColumnAttributesTypeEnum extends TypeEnumeratorReflector {
  const _ColumnAttributesTypeEnum()
      : super(
          type: ColumnAttributesType,
          name: 'ColumnAttributesType',
          annotations: const [reflect],
          optionsList: const [
            EnumOption(annotations: const [], value: ColumnAttributesType.text),
            EnumOption(annotations: const [], value: ColumnAttributesType.boolean),
            EnumOption(annotations: const [], value: ColumnAttributesType.intWithoutLimit),
            EnumOption(annotations: const [], value: ColumnAttributesType.int8),
            EnumOption(annotations: const [], value: ColumnAttributesType.int16),
            EnumOption(annotations: const [], value: ColumnAttributesType.int32),
            EnumOption(annotations: const [], value: ColumnAttributesType.int64),
            EnumOption(annotations: const [], value: ColumnAttributesType.uintWithoutLimit),
            EnumOption(annotations: const [], value: ColumnAttributesType.uint8),
            EnumOption(annotations: const [], value: ColumnAttributesType.uint16),
            EnumOption(annotations: const [], value: ColumnAttributesType.uint32),
            EnumOption(annotations: const [], value: ColumnAttributesType.uint64),
            EnumOption(annotations: const [], value: ColumnAttributesType.doubleWithoutLimit),
            EnumOption(annotations: const [], value: ColumnAttributesType.decimal),
            EnumOption(annotations: const [], value: ColumnAttributesType.dateTime),
            EnumOption(annotations: const [], value: ColumnAttributesType.binary),
            EnumOption(annotations: const [], value: ColumnAttributesType.dynamicType),
          ],
        );
}

class _CompareMultipleComparisonsLogicEnum extends TypeEnumeratorReflector {
  const _CompareMultipleComparisonsLogicEnum()
      : super(
          type: CompareMultipleComparisonsLogic,
          name: 'CompareMultipleComparisonsLogic',
          annotations: const [reflect],
          optionsList: const [
            EnumOption(annotations: const [], value: CompareMultipleComparisonsLogic.and),
            EnumOption(annotations: const [], value: CompareMultipleComparisonsLogic.or),
          ],
        );
}

class _ConditionCompareTypeEnum extends TypeEnumeratorReflector {
  const _ConditionCompareTypeEnum()
      : super(
          type: ConditionCompareType,
          name: 'ConditionCompareType',
          annotations: const [reflect],
          optionsList: const [
            EnumOption(annotations: const [], value: ConditionCompareType.equal),
            EnumOption(annotations: const [], value: ConditionCompareType.notEqual),
            EnumOption(annotations: const [], value: ConditionCompareType.greater),
            EnumOption(annotations: const [], value: ConditionCompareType.less),
            EnumOption(annotations: const [], value: ConditionCompareType.greaterEqual),
            EnumOption(annotations: const [], value: ConditionCompareType.lessEqual),
          ],
        );
}

/*----------------------------------   Class QueryField   ----------------------------------*/

/*QUERYFIELD FIELDS*/

class _QueryFieldtype extends GeneratedReflectedField<QueryField, QueryFieldType> {
  const _QueryFieldtype();
  @override
  List get annotations => const [];

  @override
  String get name => 'type';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  QueryFieldType? get defaulValue => null;

  @override
  QueryFieldType getReservedValue({required QueryField? entity}) => entity!.type;
}

class _QueryFieldfieldName extends GeneratedReflectedField<QueryField, String> {
  const _QueryFieldfieldName();
  @override
  List get annotations => const [];

  @override
  String get name => 'fieldName';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required QueryField? entity}) => entity!.fieldName;
}

class _QueryFieldnickName extends GeneratedReflectedField<QueryField, String> {
  const _QueryFieldnickName();
  @override
  List get annotations => const [];

  @override
  String get name => 'nickName';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required QueryField? entity}) => entity!.nickName;
}

class _QueryFieldtableName extends GeneratedReflectedField<QueryField, String> {
  const _QueryFieldtableName();
  @override
  List get annotations => const [];

  @override
  String get name => 'tableName';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required QueryField? entity}) => entity!.tableName;
}

/*QUERYFIELD METHODS*/

class _QueryFieldBuilder extends GeneratedReflectedMethod<QueryField, QueryField> {
  const _QueryFieldBuilder();
  @override
  String get name => '';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.buildMethod;

  @override
  List get annotations => const [];

  static const _namtype = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: QueryFieldType.field,
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'type',
  );
  static const _namfieldName = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: '',
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'fieldName',
  );
  static const _namnickName = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: '',
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'nickName',
  );
  static const _namtableName = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: '',
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'tableName',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namtype, _namfieldName, _namnickName, _namtableName];

  @override
  QueryField callReservedMethod({required QueryField? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => QueryField(
        type: _namtype.getValueFromMap(namedValues),
        fieldName: _namfieldName.getValueFromMap(namedValues),
        nickName: _namnickName.getValueFromMap(namedValues),
        tableName: _namtableName.getValueFromMap(namedValues),
      );
}

/*QUERYFIELD INSTANCE*/

class _QueryField extends GeneratedReflectedClass<QueryField> {
  const _QueryField();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [];

  @override
  bool get isAbstract => false;

  @override
  bool get isMixin => false;

  @override
  String get name => 'QueryField';

  @override
  List<GeneratedReflectedMethod> get methods => const [_QueryFieldBuilder()];

  @override
  List<GeneratedReflectedField> get fields => const [_QueryFieldtype(), _QueryFieldfieldName(), _QueryFieldnickName(), _QueryFieldtableName()];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class QueryOrder   ----------------------------------*/

/*QUERYORDER FIELDS*/

class _QueryOrderfields extends GeneratedReflectedField<QueryOrder, List<String>> {
  const _QueryOrderfields();
  @override
  List get annotations => const [];

  @override
  String get name => 'fields';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List<String>? get defaulValue => null;

  @override
  List<String> getReservedValue({required QueryOrder? entity}) => entity!.fields;
}

class _QueryOrderisAscendent extends GeneratedReflectedField<QueryOrder, bool> {
  const _QueryOrderisAscendent();
  @override
  List get annotations => const [];

  @override
  String get name => 'isAscendent';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  bool? get defaulValue => null;

  @override
  bool getReservedValue({required QueryOrder? entity}) => entity!.isAscendent;
}

/*QUERYORDER METHODS*/

class _QueryOrderBuilder extends GeneratedReflectedMethod<QueryOrder, QueryOrder> {
  const _QueryOrderBuilder();
  @override
  String get name => '';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.buildMethod;

  @override
  List get annotations => const [];

  static const _namfields = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'fields',
  );
  static const _namisAscendent = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'isAscendent',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namfields, _namisAscendent];

  @override
  QueryOrder callReservedMethod({required QueryOrder? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => QueryOrder(
        fields: _namfields.getValueFromMap(namedValues),
        isAscendent: _namisAscendent.getValueFromMap(namedValues),
      );
}

/*QUERYORDER INSTANCE*/

class _QueryOrder extends GeneratedReflectedClass<QueryOrder> {
  const _QueryOrder();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [];

  @override
  bool get isAbstract => false;

  @override
  bool get isMixin => false;

  @override
  String get name => 'QueryOrder';

  @override
  List<GeneratedReflectedMethod> get methods => const [_QueryOrderBuilder()];

  @override
  List<GeneratedReflectedField> get fields => const [_QueryOrderfields(), _QueryOrderisAscendent()];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class QueryJoiner   ----------------------------------*/

/*QUERYJOINER FIELDS*/

class _QueryJoineroriginTable extends GeneratedReflectedField<QueryJoiner, QueryTable> {
  const _QueryJoineroriginTable();
  @override
  List get annotations => const [];

  @override
  String get name => 'originTable';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  QueryTable? get defaulValue => null;

  @override
  QueryTable getReservedValue({required QueryJoiner? entity}) => entity!.originTable;
}

class _QueryJoinerexternalTable extends GeneratedReflectedField<QueryJoiner, QueryTable> {
  const _QueryJoinerexternalTable();
  @override
  List get annotations => const [];

  @override
  String get name => 'externalTable';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  QueryTable? get defaulValue => null;

  @override
  QueryTable getReservedValue({required QueryJoiner? entity}) => entity!.externalTable;
}

class _QueryJoinertype extends GeneratedReflectedField<QueryJoiner, QueryJoinerType> {
  const _QueryJoinertype();
  @override
  List get annotations => const [];

  @override
  String get name => 'type';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  QueryJoinerType? get defaulValue => null;

  @override
  QueryJoinerType getReservedValue({required QueryJoiner? entity}) => entity!.type;
}

class _QueryJoinercomparers extends GeneratedReflectedField<QueryJoiner, List<CompareFields>> {
  const _QueryJoinercomparers();
  @override
  List get annotations => const [];

  @override
  String get name => 'comparers';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List<CompareFields>? get defaulValue => null;

  @override
  List<CompareFields> getReservedValue({required QueryJoiner? entity}) => entity!.comparers;
}

/*QUERYJOINER METHODS*/

class _QueryJoinerBuilder extends GeneratedReflectedMethod<QueryJoiner, QueryJoiner> {
  const _QueryJoinerBuilder();
  @override
  String get name => '';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.buildMethod;

  @override
  List get annotations => const [];

  static const _namoriginTable = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'originTable',
  );
  static const _namexternalTable = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'externalTable',
  );
  static const _namcomparers = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'comparers',
  );
  static const _namtype = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: QueryJoinerType.inner,
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'type',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namoriginTable, _namexternalTable, _namcomparers, _namtype];

  @override
  QueryJoiner callReservedMethod({required QueryJoiner? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => QueryJoiner(
        originTable: _namoriginTable.getValueFromMap(namedValues),
        externalTable: _namexternalTable.getValueFromMap(namedValues),
        comparers: _namcomparers.getValueFromMap(namedValues),
        type: _namtype.getValueFromMap(namedValues),
      );
}

/*QUERYJOINER INSTANCE*/

class _QueryJoiner extends GeneratedReflectedClass<QueryJoiner> {
  const _QueryJoiner();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [];

  @override
  bool get isAbstract => false;

  @override
  bool get isMixin => false;

  @override
  String get name => 'QueryJoiner';

  @override
  List<GeneratedReflectedMethod> get methods => const [_QueryJoinerBuilder()];

  @override
  List<GeneratedReflectedField> get fields => const [_QueryJoineroriginTable(), _QueryJoinerexternalTable(), _QueryJoinertype(), _QueryJoinercomparers()];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class ColumnAttributes   ----------------------------------*/

/*COLUMNATTRIBUTES FIELDS*/

class _ColumnAttributesnameColumn extends GeneratedReflectedField<ColumnAttributes, String> {
  const _ColumnAttributesnameColumn();
  @override
  List get annotations => const [];

  @override
  String get name => 'nameColumn';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required ColumnAttributes? entity}) => entity!.nameColumn;
}

class _ColumnAttributestype extends GeneratedReflectedField<ColumnAttributes, ColumnAttributesType> {
  const _ColumnAttributestype();
  @override
  List get annotations => const [];

  @override
  String get name => 'type';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  ColumnAttributesType? get defaulValue => null;

  @override
  ColumnAttributesType getReservedValue({required ColumnAttributes? entity}) => entity!.type;
}

class _ColumnAttributesisPrimaryKey extends GeneratedReflectedField<ColumnAttributes, bool> {
  const _ColumnAttributesisPrimaryKey();
  @override
  List get annotations => const [];

  @override
  String get name => 'isPrimaryKey';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  bool? get defaulValue => null;

  @override
  bool getReservedValue({required ColumnAttributes? entity}) => entity!.isPrimaryKey;
}

class _ColumnAttributesisUniqueKey extends GeneratedReflectedField<ColumnAttributes, bool> {
  const _ColumnAttributesisUniqueKey();
  @override
  List get annotations => const [];

  @override
  String get name => 'isUniqueKey';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  bool? get defaulValue => null;

  @override
  bool getReservedValue({required ColumnAttributes? entity}) => entity!.isUniqueKey;
}

class _ColumnAttributesisAutoIncrement extends GeneratedReflectedField<ColumnAttributes, bool> {
  const _ColumnAttributesisAutoIncrement();
  @override
  List get annotations => const [];

  @override
  String get name => 'isAutoIncrement';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  bool? get defaulValue => null;

  @override
  bool getReservedValue({required ColumnAttributes? entity}) => entity!.isAutoIncrement;
}

/*COLUMNATTRIBUTES METHODS*/

class _ColumnAttributessearchColumnTypeMethod extends GeneratedReflectedMethod<ColumnAttributes, ColumnAttributesType> {
  const _ColumnAttributessearchColumnTypeMethod();
  @override
  String get name => 'searchColumnType';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _fix0 = GeneratedReflectedFixedParameter<Type>(
    annotations: const [],
    name: 'dartType',
    position: 0,
    hasDefaultValue: false,
    defaultValue: null,
    acceptNulls: false,
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [_fix0];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [];

  @override
  ColumnAttributesType callReservedMethod({required ColumnAttributes? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => ColumnAttributes.searchColumnType(
        _fix0.getValueFromList(fixedValues),
      );
}

class _ColumnAttributesBuilder extends GeneratedReflectedMethod<ColumnAttributes, ColumnAttributes> {
  const _ColumnAttributesBuilder();
  @override
  String get name => '';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.buildMethod;

  @override
  List get annotations => const [];

  static const _namnameColumn = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'nameColumn',
  );
  static const _namtype = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'type',
  );
  static const _namisPrimaryKey = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: false,
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'isPrimaryKey',
  );
  static const _namisUniqueKey = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: false,
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'isUniqueKey',
  );
  static const _namisAutoIncrement = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: false,
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'isAutoIncrement',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namnameColumn, _namtype, _namisPrimaryKey, _namisUniqueKey, _namisAutoIncrement];

  @override
  ColumnAttributes callReservedMethod({required ColumnAttributes? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => ColumnAttributes(
        nameColumn: _namnameColumn.getValueFromMap(namedValues),
        type: _namtype.getValueFromMap(namedValues),
        isPrimaryKey: _namisPrimaryKey.getValueFromMap(namedValues),
        isUniqueKey: _namisUniqueKey.getValueFromMap(namedValues),
        isAutoIncrement: _namisAutoIncrement.getValueFromMap(namedValues),
      );
}

class _ColumnAttributesfromDartTypeFactorie extends GeneratedReflectedMethod<ColumnAttributes, ColumnAttributes> {
  const _ColumnAttributesfromDartTypeFactorie();
  @override
  String get name => 'fromDartType';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.factoryMethod;

  @override
  List get annotations => const [];

  static const _namnameColumn = GeneratedReflectedNamedParameter<String>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'nameColumn',
  );
  static const _namtype = GeneratedReflectedNamedParameter<Type>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'type',
  );
  static const _namisPrimaryKey = GeneratedReflectedNamedParameter<bool>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'isPrimaryKey',
  );
  static const _namisUniqueKey = GeneratedReflectedNamedParameter<bool>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'isUniqueKey',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namnameColumn, _namtype, _namisPrimaryKey, _namisUniqueKey];

  @override
  ColumnAttributes callReservedMethod({required ColumnAttributes? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => ColumnAttributes.fromDartType(
        nameColumn: _namnameColumn.getValueFromMap(namedValues),
        type: _namtype.getValueFromMap(namedValues),
        isPrimaryKey: _namisPrimaryKey.getValueFromMap(namedValues),
        isUniqueKey: _namisUniqueKey.getValueFromMap(namedValues),
      );
}

/*COLUMNATTRIBUTES INSTANCE*/

class _ColumnAttributes extends GeneratedReflectedClass<ColumnAttributes> {
  const _ColumnAttributes();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [];

  @override
  bool get isAbstract => false;

  @override
  bool get isMixin => false;

  @override
  String get name => 'ColumnAttributes';

  @override
  List<GeneratedReflectedMethod> get methods => const [_ColumnAttributessearchColumnTypeMethod(), _ColumnAttributesBuilder(), _ColumnAttributesfromDartTypeFactorie()];

  @override
  List<GeneratedReflectedField> get fields => const [_ColumnAttributesnameColumn(), _ColumnAttributestype(), _ColumnAttributesisPrimaryKey(), _ColumnAttributesisUniqueKey(), _ColumnAttributesisAutoIncrement()];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class QueryTable   ----------------------------------*/

/*QUERYTABLE FIELDS*/

class _QueryTablefieldName extends GeneratedReflectedField<QueryTable, String> {
  const _QueryTablefieldName();
  @override
  List get annotations => const [];

  @override
  String get name => 'fieldName';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required QueryTable? entity}) => entity!.fieldName;
}

class _QueryTablenickName extends GeneratedReflectedField<QueryTable, String> {
  const _QueryTablenickName();
  @override
  List get annotations => const [];

  @override
  String get name => 'nickName';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required QueryTable? entity}) => entity!.nickName;
}

/*QUERYTABLE METHODS*/

class _QueryTableBuilder extends GeneratedReflectedMethod<QueryTable, QueryTable> {
  const _QueryTableBuilder();
  @override
  String get name => '';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.buildMethod;

  @override
  List get annotations => const [];

  static const _namfieldName = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'fieldName',
  );
  static const _namnickName = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: '',
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'nickName',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namfieldName, _namnickName];

  @override
  QueryTable callReservedMethod({required QueryTable? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => QueryTable(
        fieldName: _namfieldName.getValueFromMap(namedValues),
        nickName: _namnickName.getValueFromMap(namedValues),
      );
}

/*QUERYTABLE INSTANCE*/

class _QueryTable extends GeneratedReflectedClass<QueryTable> {
  const _QueryTable();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [];

  @override
  bool get isAbstract => false;

  @override
  bool get isMixin => false;

  @override
  String get name => 'QueryTable';

  @override
  List<GeneratedReflectedMethod> get methods => const [_QueryTableBuilder()];

  @override
  List<GeneratedReflectedField> get fields => const [_QueryTablefieldName(), _QueryTablenickName()];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class ForeignKey   ----------------------------------*/

/*FOREIGNKEY FIELDS*/

class _ForeignKeyfieldName extends GeneratedReflectedField<ForeignKey, String> {
  const _ForeignKeyfieldName();
  @override
  List get annotations => const [];

  @override
  String get name => 'fieldName';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required ForeignKey? entity}) => entity!.fieldName;
}

class _ForeignKeytableName extends GeneratedReflectedField<ForeignKey, String> {
  const _ForeignKeytableName();
  @override
  List get annotations => const [];

  @override
  String get name => 'tableName';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required ForeignKey? entity}) => entity!.tableName;
}

class _ForeignKeyreferenceFieldName extends GeneratedReflectedField<ForeignKey, String> {
  const _ForeignKeyreferenceFieldName();
  @override
  List get annotations => const [];

  @override
  String get name => 'referenceFieldName';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required ForeignKey? entity}) => entity!.referenceFieldName;
}

/*FOREIGNKEY METHODS*/

class _ForeignKeyBuilder extends GeneratedReflectedMethod<ForeignKey, ForeignKey> {
  const _ForeignKeyBuilder();
  @override
  String get name => '';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.buildMethod;

  @override
  List get annotations => const [];

  static const _namfieldName = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'fieldName',
  );
  static const _namtableName = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'tableName',
  );
  static const _namreferenceFieldName = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'referenceFieldName',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namfieldName, _namtableName, _namreferenceFieldName];

  @override
  ForeignKey callReservedMethod({required ForeignKey? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => ForeignKey(
        fieldName: _namfieldName.getValueFromMap(namedValues),
        tableName: _namtableName.getValueFromMap(namedValues),
        referenceFieldName: _namreferenceFieldName.getValueFromMap(namedValues),
      );
}

/*FOREIGNKEY INSTANCE*/

class _ForeignKey extends GeneratedReflectedClass<ForeignKey> {
  const _ForeignKey();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [];

  @override
  bool get isAbstract => false;

  @override
  bool get isMixin => false;

  @override
  String get name => 'ForeignKey';

  @override
  List<GeneratedReflectedMethod> get methods => const [_ForeignKeyBuilder()];

  @override
  List<GeneratedReflectedField> get fields => const [_ForeignKeyfieldName(), _ForeignKeytableName(), _ForeignKeyreferenceFieldName()];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class CompareFields   ----------------------------------*/

/*COMPAREFIELDS FIELDS*/

class _CompareFieldsoriginField extends GeneratedReflectedField<CompareFields, String> {
  const _CompareFieldsoriginField();
  @override
  List get annotations => const [];

  @override
  String get name => 'originField';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required CompareFields? entity}) => entity!.originField;
}

class _CompareFieldscompareField extends GeneratedReflectedField<CompareFields, String> {
  const _CompareFieldscompareField();
  @override
  List get annotations => const [];

  @override
  String get name => 'compareField';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required CompareFields? entity}) => entity!.compareField;
}

class _CompareFieldsoriginFieldTable extends GeneratedReflectedField<CompareFields, String> {
  const _CompareFieldsoriginFieldTable();
  @override
  List get annotations => const [];

  @override
  String get name => 'originFieldTable';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required CompareFields? entity}) => entity!.originFieldTable;
}

class _CompareFieldscompareFieldTable extends GeneratedReflectedField<CompareFields, String> {
  const _CompareFieldscompareFieldTable();
  @override
  List get annotations => const [];

  @override
  String get name => 'compareFieldTable';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required CompareFields? entity}) => entity!.compareFieldTable;
}

class _CompareFieldstypeComparation extends GeneratedReflectedField<CompareFields, ConditionCompareType> {
  const _CompareFieldstypeComparation();
  @override
  List get annotations => const [];

  @override
  String get name => 'typeComparation';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  ConditionCompareType? get defaulValue => null;

  @override
  ConditionCompareType getReservedValue({required CompareFields? entity}) => entity!.typeComparation;
}

/*COMPAREFIELDS METHODS*/

class _CompareFieldsBuilder extends GeneratedReflectedMethod<CompareFields, CompareFields> {
  const _CompareFieldsBuilder();
  @override
  String get name => '';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.buildMethod;

  @override
  List get annotations => const [];

  static const _namoriginField = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'originField',
  );
  static const _namcompareField = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'compareField',
  );
  static const _namtypeComparation = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: ConditionCompareType.equal,
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'typeComparation',
  );
  static const _namoriginFieldTable = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: '',
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'originFieldTable',
  );
  static const _namcompareFieldTable = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: '',
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'compareFieldTable',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namoriginField, _namcompareField, _namtypeComparation, _namoriginFieldTable, _namcompareFieldTable];

  @override
  CompareFields callReservedMethod({required CompareFields? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => CompareFields(
        originField: _namoriginField.getValueFromMap(namedValues),
        compareField: _namcompareField.getValueFromMap(namedValues),
        typeComparation: _namtypeComparation.getValueFromMap(namedValues),
        originFieldTable: _namoriginFieldTable.getValueFromMap(namedValues),
        compareFieldTable: _namcompareFieldTable.getValueFromMap(namedValues),
      );
}

/*COMPAREFIELDS INSTANCE*/

class _CompareFields extends GeneratedReflectedClass<CompareFields> {
  const _CompareFields();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [IConditionQuery];

  @override
  bool get isAbstract => false;

  @override
  bool get isMixin => false;

  @override
  String get name => 'CompareFields';

  @override
  List<GeneratedReflectedMethod> get methods => const [_CompareFieldsBuilder()];

  @override
  List<GeneratedReflectedField> get fields => const [_CompareFieldsoriginField(), _CompareFieldscompareField(), _CompareFieldsoriginFieldTable(), _CompareFieldscompareFieldTable(), _CompareFieldstypeComparation()];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class CompareValue   ----------------------------------*/

/*COMPAREVALUE FIELDS*/

class _CompareValueoriginField extends GeneratedReflectedField<CompareValue, String> {
  const _CompareValueoriginField();
  @override
  List get annotations => const [];

  @override
  String get name => 'originField';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required CompareValue? entity}) => entity!.originField;
}

class _CompareValuevalue extends GeneratedReflectedField<CompareValue, dynamic> {
  const _CompareValuevalue();
  @override
  List get annotations => const [];

  @override
  String get name => 'value';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  dynamic get defaulValue => null;

  @override
  dynamic getReservedValue({required CompareValue? entity}) => entity!.value;
}

class _CompareValuetypeComparation extends GeneratedReflectedField<CompareValue, ConditionCompareType> {
  const _CompareValuetypeComparation();
  @override
  List get annotations => const [];

  @override
  String get name => 'typeComparation';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  ConditionCompareType? get defaulValue => null;

  @override
  ConditionCompareType getReservedValue({required CompareValue? entity}) => entity!.typeComparation;
}

class _CompareValueshieldValue extends GeneratedReflectedField<CompareValue, bool> {
  const _CompareValueshieldValue();
  @override
  List get annotations => const [];

  @override
  String get name => 'shieldValue';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  bool? get defaulValue => null;

  @override
  bool getReservedValue({required CompareValue? entity}) => entity!.shieldValue;
}

class _CompareValueselectedTable extends GeneratedReflectedField<CompareValue, String> {
  const _CompareValueselectedTable();
  @override
  List get annotations => const [];

  @override
  String get name => 'selectedTable';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required CompareValue? entity}) => entity!.selectedTable;
}

/*COMPAREVALUE METHODS*/

class _CompareValueBuilder extends GeneratedReflectedMethod<CompareValue, CompareValue> {
  const _CompareValueBuilder();
  @override
  String get name => '';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.buildMethod;

  @override
  List get annotations => const [];

  static const _namoriginField = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'originField',
  );
  static const _namvalue = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'value',
  );
  static const _namtypeComparation = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: ConditionCompareType.equal,
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'typeComparation',
  );
  static const _namshieldValue = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: true,
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'shieldValue',
  );
  static const _namselectedTable = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: '',
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'selectedTable',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namoriginField, _namvalue, _namtypeComparation, _namshieldValue, _namselectedTable];

  @override
  CompareValue callReservedMethod({required CompareValue? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => CompareValue(
        originField: _namoriginField.getValueFromMap(namedValues),
        value: _namvalue.getValueFromMap(namedValues),
        typeComparation: _namtypeComparation.getValueFromMap(namedValues),
        shieldValue: _namshieldValue.getValueFromMap(namedValues),
        selectedTable: _namselectedTable.getValueFromMap(namedValues),
      );
}

/*COMPAREVALUE INSTANCE*/

class _CompareValue extends GeneratedReflectedClass<CompareValue> {
  const _CompareValue();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [IConditionQuery];

  @override
  bool get isAbstract => false;

  @override
  bool get isMixin => false;

  @override
  String get name => 'CompareValue';

  @override
  List<GeneratedReflectedMethod> get methods => const [_CompareValueBuilder()];

  @override
  List<GeneratedReflectedField> get fields => const [_CompareValueoriginField(), _CompareValuevalue(), _CompareValuetypeComparation(), _CompareValueshieldValue(), _CompareValueselectedTable()];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class CompareSimilarText   ----------------------------------*/

/*COMPARESIMILARTEXT FIELDS*/

class _CompareSimilarTextfieldName extends GeneratedReflectedField<CompareSimilarText, String> {
  const _CompareSimilarTextfieldName();
  @override
  List get annotations => const [];

  @override
  String get name => 'fieldName';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required CompareSimilarText? entity}) => entity!.fieldName;
}

class _CompareSimilarTextsimilarText extends GeneratedReflectedField<CompareSimilarText, String> {
  const _CompareSimilarTextsimilarText();
  @override
  List get annotations => const [];

  @override
  String get name => 'similarText';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required CompareSimilarText? entity}) => entity!.similarText;
}

class _CompareSimilarTextshieldValue extends GeneratedReflectedField<CompareSimilarText, bool> {
  const _CompareSimilarTextshieldValue();
  @override
  List get annotations => const [];

  @override
  String get name => 'shieldValue';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  bool? get defaulValue => null;

  @override
  bool getReservedValue({required CompareSimilarText? entity}) => entity!.shieldValue;
}

class _CompareSimilarTextselectedTable extends GeneratedReflectedField<CompareSimilarText, String> {
  const _CompareSimilarTextselectedTable();
  @override
  List get annotations => const [];

  @override
  String get name => 'selectedTable';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required CompareSimilarText? entity}) => entity!.selectedTable;
}

/*COMPARESIMILARTEXT METHODS*/

class _CompareSimilarTextBuilder extends GeneratedReflectedMethod<CompareSimilarText, CompareSimilarText> {
  const _CompareSimilarTextBuilder();
  @override
  String get name => '';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.buildMethod;

  @override
  List get annotations => const [];

  static const _namfieldName = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'fieldName',
  );
  static const _namsimilarText = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'similarText',
  );
  static const _namshieldValue = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: true,
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'shieldValue',
  );
  static const _namselectedTable = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: '',
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'selectedTable',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namfieldName, _namsimilarText, _namshieldValue, _namselectedTable];

  @override
  CompareSimilarText callReservedMethod({required CompareSimilarText? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => CompareSimilarText(
        fieldName: _namfieldName.getValueFromMap(namedValues),
        similarText: _namsimilarText.getValueFromMap(namedValues),
        shieldValue: _namshieldValue.getValueFromMap(namedValues),
        selectedTable: _namselectedTable.getValueFromMap(namedValues),
      );
}

/*COMPARESIMILARTEXT INSTANCE*/

class _CompareSimilarText extends GeneratedReflectedClass<CompareSimilarText> {
  const _CompareSimilarText();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [IConditionQuery];

  @override
  bool get isAbstract => false;

  @override
  bool get isMixin => false;

  @override
  String get name => 'CompareSimilarText';

  @override
  List<GeneratedReflectedMethod> get methods => const [_CompareSimilarTextBuilder()];

  @override
  List<GeneratedReflectedField> get fields => const [_CompareSimilarTextfieldName(), _CompareSimilarTextsimilarText(), _CompareSimilarTextshieldValue(), _CompareSimilarTextselectedTable()];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class CompareIncludesValues   ----------------------------------*/

/*COMPAREINCLUDESVALUES FIELDS*/

class _CompareIncludesValuesfieldName extends GeneratedReflectedField<CompareIncludesValues, String> {
  const _CompareIncludesValuesfieldName();
  @override
  List get annotations => const [];

  @override
  String get name => 'fieldName';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required CompareIncludesValues? entity}) => entity!.fieldName;
}

class _CompareIncludesValuesselectedTable extends GeneratedReflectedField<CompareIncludesValues, String> {
  const _CompareIncludesValuesselectedTable();
  @override
  List get annotations => const [];

  @override
  String get name => 'selectedTable';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required CompareIncludesValues? entity}) => entity!.selectedTable;
}

class _CompareIncludesValuesoptions extends GeneratedReflectedField<CompareIncludesValues, List> {
  const _CompareIncludesValuesoptions();
  @override
  List get annotations => const [];

  @override
  String get name => 'options';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List? get defaulValue => null;

  @override
  List getReservedValue({required CompareIncludesValues? entity}) => entity!.options;
}

class _CompareIncludesValuesshieldValue extends GeneratedReflectedField<CompareIncludesValues, bool> {
  const _CompareIncludesValuesshieldValue();
  @override
  List get annotations => const [];

  @override
  String get name => 'shieldValue';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  bool? get defaulValue => null;

  @override
  bool getReservedValue({required CompareIncludesValues? entity}) => entity!.shieldValue;
}

class _CompareIncludesValuesisInclusive extends GeneratedReflectedField<CompareIncludesValues, bool> {
  const _CompareIncludesValuesisInclusive();
  @override
  List get annotations => const [];

  @override
  String get name => 'isInclusive';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  bool? get defaulValue => null;

  @override
  bool getReservedValue({required CompareIncludesValues? entity}) => entity!.isInclusive;
}

/*COMPAREINCLUDESVALUES METHODS*/

class _CompareIncludesValuesBuilder extends GeneratedReflectedMethod<CompareIncludesValues, CompareIncludesValues> {
  const _CompareIncludesValuesBuilder();
  @override
  String get name => '';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.buildMethod;

  @override
  List get annotations => const [];

  static const _namfieldName = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'fieldName',
  );
  static const _namoptions = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'options',
  );
  static const _namselectedTable = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: '',
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'selectedTable',
  );
  static const _namshieldValue = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: true,
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'shieldValue',
  );
  static const _namisInclusive = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: true,
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'isInclusive',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namfieldName, _namoptions, _namselectedTable, _namshieldValue, _namisInclusive];

  @override
  CompareIncludesValues callReservedMethod({required CompareIncludesValues? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => CompareIncludesValues(
        fieldName: _namfieldName.getValueFromMap(namedValues),
        options: _namoptions.getValueFromMap(namedValues),
        selectedTable: _namselectedTable.getValueFromMap(namedValues),
        shieldValue: _namshieldValue.getValueFromMap(namedValues),
        isInclusive: _namisInclusive.getValueFromMap(namedValues),
      );
}

/*COMPAREINCLUDESVALUES INSTANCE*/

class _CompareIncludesValues extends GeneratedReflectedClass<CompareIncludesValues> {
  const _CompareIncludesValues();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [IConditionQuery];

  @override
  bool get isAbstract => false;

  @override
  bool get isMixin => false;

  @override
  String get name => 'CompareIncludesValues';

  @override
  List<GeneratedReflectedMethod> get methods => const [_CompareIncludesValuesBuilder()];

  @override
  List<GeneratedReflectedField> get fields =>
      const [_CompareIncludesValuesfieldName(), _CompareIncludesValuesselectedTable(), _CompareIncludesValuesoptions(), _CompareIncludesValuesshieldValue(), _CompareIncludesValuesisInclusive()];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class CompareMultipleComparisons   ----------------------------------*/

/*COMPAREMULTIPLECOMPARISONS FIELDS*/

class _CompareMultipleComparisonstypeComparation extends GeneratedReflectedField<CompareMultipleComparisons, CompareMultipleComparisonsLogic> {
  const _CompareMultipleComparisonstypeComparation();
  @override
  List get annotations => const [];

  @override
  String get name => 'typeComparation';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  CompareMultipleComparisonsLogic? get defaulValue => null;

  @override
  CompareMultipleComparisonsLogic getReservedValue({required CompareMultipleComparisons? entity}) => entity!.typeComparation;
}

class _CompareMultipleComparisonsconditions extends GeneratedReflectedField<CompareMultipleComparisons, List<IConditionQuery>> {
  const _CompareMultipleComparisonsconditions();
  @override
  List get annotations => const [];

  @override
  String get name => 'conditions';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List<IConditionQuery>? get defaulValue => null;

  @override
  List<IConditionQuery> getReservedValue({required CompareMultipleComparisons? entity}) => entity!.conditions;
}

/*COMPAREMULTIPLECOMPARISONS METHODS*/

class _CompareMultipleComparisonsBuilder extends GeneratedReflectedMethod<CompareMultipleComparisons, CompareMultipleComparisons> {
  const _CompareMultipleComparisonsBuilder();
  @override
  String get name => '';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.buildMethod;

  @override
  List get annotations => const [];

  static const _namconditions = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'conditions',
  );
  static const _namtypeComparation = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: CompareMultipleComparisonsLogic.and,
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'typeComparation',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namconditions, _namtypeComparation];

  @override
  CompareMultipleComparisons callReservedMethod({required CompareMultipleComparisons? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => CompareMultipleComparisons(
        conditions: _namconditions.getValueFromMap(namedValues),
        typeComparation: _namtypeComparation.getValueFromMap(namedValues),
      );
}

/*COMPAREMULTIPLECOMPARISONS INSTANCE*/

class _CompareMultipleComparisons extends GeneratedReflectedClass<CompareMultipleComparisons> {
  const _CompareMultipleComparisons();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [IConditionQuery];

  @override
  bool get isAbstract => false;

  @override
  bool get isMixin => false;

  @override
  String get name => 'CompareMultipleComparisons';

  @override
  List<GeneratedReflectedMethod> get methods => const [_CompareMultipleComparisonsBuilder()];

  @override
  List<GeneratedReflectedField> get fields => const [_CompareMultipleComparisonstypeComparation(), _CompareMultipleComparisonsconditions()];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class QueryCommand   ----------------------------------*/

/*QUERYCOMMAND FIELDS*/

class _QueryCommandselectedFields extends GeneratedReflectedField<QueryCommand, List<QueryField>> {
  const _QueryCommandselectedFields();
  @override
  List get annotations => const [];

  @override
  String get name => 'selectedFields';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List<QueryField>? get defaulValue => null;

  @override
  List<QueryField> getReservedValue({required QueryCommand? entity}) => entity!.selectedFields;
}

class _QueryCommandselectedTables extends GeneratedReflectedField<QueryCommand, List<QueryTable>> {
  const _QueryCommandselectedTables();
  @override
  List get annotations => const [];

  @override
  String get name => 'selectedTables';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List<QueryTable>? get defaulValue => null;

  @override
  List<QueryTable> getReservedValue({required QueryCommand? entity}) => entity!.selectedTables;
}

class _QueryCommandjoinedTables extends GeneratedReflectedField<QueryCommand, List<QueryJoiner>> {
  const _QueryCommandjoinedTables();
  @override
  List get annotations => const [];

  @override
  String get name => 'joinedTables';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List<QueryJoiner>? get defaulValue => null;

  @override
  List<QueryJoiner> getReservedValue({required QueryCommand? entity}) => entity!.joinedTables;
}

class _QueryCommandconditions extends GeneratedReflectedField<QueryCommand, List<IConditionQuery>> {
  const _QueryCommandconditions();
  @override
  List get annotations => const [];

  @override
  String get name => 'conditions';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List<IConditionQuery>? get defaulValue => null;

  @override
  List<IConditionQuery> getReservedValue({required QueryCommand? entity}) => entity!.conditions;
}

class _QueryCommandorders extends GeneratedReflectedField<QueryCommand, List<QueryOrder>> {
  const _QueryCommandorders();
  @override
  List get annotations => const [];

  @override
  String get name => 'orders';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List<QueryOrder>? get defaulValue => null;

  @override
  List<QueryOrder> getReservedValue({required QueryCommand? entity}) => entity!.orders;
}

class _QueryCommandgrouped extends GeneratedReflectedField<QueryCommand, List<String>> {
  const _QueryCommandgrouped();
  @override
  List get annotations => const [];

  @override
  String get name => 'grouped';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List<String>? get defaulValue => null;

  @override
  List<String> getReservedValue({required QueryCommand? entity}) => entity!.grouped;
}

class _QueryCommandhavings extends GeneratedReflectedField<QueryCommand, List<IConditionQuery>> {
  const _QueryCommandhavings();
  @override
  List get annotations => const [];

  @override
  String get name => 'havings';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List<IConditionQuery>? get defaulValue => null;

  @override
  List<IConditionQuery> getReservedValue({required QueryCommand? entity}) => entity!.havings;
}

class _QueryCommandlimit extends GeneratedReflectedField<QueryCommand, int?> {
  const _QueryCommandlimit();
  @override
  List get annotations => const [];

  @override
  String get name => 'limit';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  int? get defaulValue => null;

  @override
  int? getReservedValue({required QueryCommand? entity}) => entity!.limit;
}

/*QUERYCOMMAND METHODS*/

class _QueryCommandBuilder extends GeneratedReflectedMethod<QueryCommand, QueryCommand> {
  const _QueryCommandBuilder();
  @override
  String get name => '';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.buildMethod;

  @override
  List get annotations => const [];

  static const _namselectedTables = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'selectedTables',
  );
  static const _namselectedFields = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: const [],
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'selectedFields',
  );
  static const _namjoinedTables = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: const [],
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'joinedTables',
  );
  static const _namconditions = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: const [],
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'conditions',
  );
  static const _namorders = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: const [],
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'orders',
  );
  static const _namgrouped = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: const [],
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'grouped',
  );
  static const _namhavings = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: const [],
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'havings',
  );
  static const _namlimit = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'limit',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namselectedTables, _namselectedFields, _namjoinedTables, _namconditions, _namorders, _namgrouped, _namhavings, _namlimit];

  @override
  QueryCommand callReservedMethod({required QueryCommand? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => QueryCommand(
        selectedTables: _namselectedTables.getValueFromMap(namedValues),
        selectedFields: _namselectedFields.getValueFromMap(namedValues),
        joinedTables: _namjoinedTables.getValueFromMap(namedValues),
        conditions: _namconditions.getValueFromMap(namedValues),
        orders: _namorders.getValueFromMap(namedValues),
        grouped: _namgrouped.getValueFromMap(namedValues),
        havings: _namhavings.getValueFromMap(namedValues),
        limit: _namlimit.getValueFromMap(namedValues),
      );
}

/*QUERYCOMMAND INSTANCE*/

class _QueryCommand extends GeneratedReflectedClass<QueryCommand> {
  const _QueryCommand();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [IDataBaseCommand];

  @override
  bool get isAbstract => false;

  @override
  bool get isMixin => false;

  @override
  String get name => 'QueryCommand';

  @override
  List<GeneratedReflectedMethod> get methods => const [_QueryCommandBuilder()];

  @override
  List<GeneratedReflectedField> get fields => const [
        _QueryCommandselectedFields(),
        _QueryCommandselectedTables(),
        _QueryCommandjoinedTables(),
        _QueryCommandconditions(),
        _QueryCommandorders(),
        _QueryCommandgrouped(),
        _QueryCommandhavings(),
        _QueryCommandlimit()
      ];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class AggregatorCommand   ----------------------------------*/

/*AGGREGATORCOMMAND FIELDS*/

class _AggregatorCommandtableName extends GeneratedReflectedField<AggregatorCommand, String> {
  const _AggregatorCommandtableName();
  @override
  List get annotations => const [];

  @override
  String get name => 'tableName';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required AggregatorCommand? entity}) => entity!.tableName;
}

class _AggregatorCommanddataField extends GeneratedReflectedField<AggregatorCommand, Map<String, dynamic>> {
  const _AggregatorCommanddataField();
  @override
  List get annotations => const [];

  @override
  String get name => 'dataField';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  Map<String, dynamic>? get defaulValue => null;

  @override
  Map<String, dynamic> getReservedValue({required AggregatorCommand? entity}) => entity!.dataField;
}

/*AGGREGATORCOMMAND METHODS*/

class _AggregatorCommandBuilder extends GeneratedReflectedMethod<AggregatorCommand, AggregatorCommand> {
  const _AggregatorCommandBuilder();
  @override
  String get name => '';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.buildMethod;

  @override
  List get annotations => const [];

  static const _namtableName = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'tableName',
  );
  static const _namdataField = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'dataField',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namtableName, _namdataField];

  @override
  AggregatorCommand callReservedMethod({required AggregatorCommand? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => AggregatorCommand(
        tableName: _namtableName.getValueFromMap(namedValues),
        dataField: _namdataField.getValueFromMap(namedValues),
      );
}

/*AGGREGATORCOMMAND INSTANCE*/

class _AggregatorCommand extends GeneratedReflectedClass<AggregatorCommand> {
  const _AggregatorCommand();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [IDataBaseCommand];

  @override
  bool get isAbstract => false;

  @override
  bool get isMixin => false;

  @override
  String get name => 'AggregatorCommand';

  @override
  List<GeneratedReflectedMethod> get methods => const [_AggregatorCommandBuilder()];

  @override
  List<GeneratedReflectedField> get fields => const [_AggregatorCommandtableName(), _AggregatorCommanddataField()];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class ModifierCommand   ----------------------------------*/

/*MODIFIERCOMMAND FIELDS*/

class _ModifierCommandtableName extends GeneratedReflectedField<ModifierCommand, String> {
  const _ModifierCommandtableName();
  @override
  List get annotations => const [];

  @override
  String get name => 'tableName';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required ModifierCommand? entity}) => entity!.tableName;
}

class _ModifierCommanddataField extends GeneratedReflectedField<ModifierCommand, Map<String, dynamic>> {
  const _ModifierCommanddataField();
  @override
  List get annotations => const [];

  @override
  String get name => 'dataField';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  Map<String, dynamic>? get defaulValue => null;

  @override
  Map<String, dynamic> getReservedValue({required ModifierCommand? entity}) => entity!.dataField;
}

class _ModifierCommandconditions extends GeneratedReflectedField<ModifierCommand, List<IConditionQuery>> {
  const _ModifierCommandconditions();
  @override
  List get annotations => const [];

  @override
  String get name => 'conditions';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List<IConditionQuery>? get defaulValue => null;

  @override
  List<IConditionQuery> getReservedValue({required ModifierCommand? entity}) => entity!.conditions;
}

/*MODIFIERCOMMAND METHODS*/

class _ModifierCommandBuilder extends GeneratedReflectedMethod<ModifierCommand, ModifierCommand> {
  const _ModifierCommandBuilder();
  @override
  String get name => '';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.buildMethod;

  @override
  List get annotations => const [];

  static const _namtableName = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'tableName',
  );
  static const _namdataField = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'dataField',
  );
  static const _namconditions = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'conditions',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namtableName, _namdataField, _namconditions];

  @override
  ModifierCommand callReservedMethod({required ModifierCommand? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => ModifierCommand(
        tableName: _namtableName.getValueFromMap(namedValues),
        dataField: _namdataField.getValueFromMap(namedValues),
        conditions: _namconditions.getValueFromMap(namedValues),
      );
}

/*MODIFIERCOMMAND INSTANCE*/

class _ModifierCommand extends GeneratedReflectedClass<ModifierCommand> {
  const _ModifierCommand();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [IDataBaseCommand];

  @override
  bool get isAbstract => false;

  @override
  bool get isMixin => false;

  @override
  String get name => 'ModifierCommand';

  @override
  List<GeneratedReflectedMethod> get methods => const [_ModifierCommandBuilder()];

  @override
  List<GeneratedReflectedField> get fields => const [_ModifierCommandtableName(), _ModifierCommanddataField(), _ModifierCommandconditions()];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class DeleteCommand   ----------------------------------*/

/*DELETECOMMAND FIELDS*/

class _DeleteCommandtableName extends GeneratedReflectedField<DeleteCommand, String> {
  const _DeleteCommandtableName();
  @override
  List get annotations => const [];

  @override
  String get name => 'tableName';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required DeleteCommand? entity}) => entity!.tableName;
}

class _DeleteCommandconditions extends GeneratedReflectedField<DeleteCommand, List<IConditionQuery>> {
  const _DeleteCommandconditions();
  @override
  List get annotations => const [];

  @override
  String get name => 'conditions';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List<IConditionQuery>? get defaulValue => null;

  @override
  List<IConditionQuery> getReservedValue({required DeleteCommand? entity}) => entity!.conditions;
}

/*DELETECOMMAND METHODS*/

class _DeleteCommandBuilder extends GeneratedReflectedMethod<DeleteCommand, DeleteCommand> {
  const _DeleteCommandBuilder();
  @override
  String get name => '';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.buildMethod;

  @override
  List get annotations => const [];

  static const _namtableName = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'tableName',
  );
  static const _namconditions = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: const [],
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'conditions',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namtableName, _namconditions];

  @override
  DeleteCommand callReservedMethod({required DeleteCommand? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => DeleteCommand(
        tableName: _namtableName.getValueFromMap(namedValues),
        conditions: _namconditions.getValueFromMap(namedValues),
      );
}

/*DELETECOMMAND INSTANCE*/

class _DeleteCommand extends GeneratedReflectedClass<DeleteCommand> {
  const _DeleteCommand();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [IDataBaseCommand];

  @override
  bool get isAbstract => false;

  @override
  bool get isMixin => false;

  @override
  String get name => 'DeleteCommand';

  @override
  List<GeneratedReflectedMethod> get methods => const [_DeleteCommandBuilder()];

  @override
  List<GeneratedReflectedField> get fields => const [_DeleteCommandtableName(), _DeleteCommandconditions()];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class IConditionQuery   ----------------------------------*/

/*ICONDITIONQUERY FIELDS*/

/*ICONDITIONQUERY METHODS*/

/*ICONDITIONQUERY INSTANCE*/

class _IConditionQuery extends GeneratedReflectedClass<IConditionQuery> {
  const _IConditionQuery();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [];

  @override
  bool get isAbstract => true;

  @override
  bool get isMixin => true;

  @override
  String get name => 'IConditionQuery';

  @override
  List<GeneratedReflectedMethod> get methods => const [];

  @override
  List<GeneratedReflectedField> get fields => const [];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class CreateTableCommand   ----------------------------------*/

/*CREATETABLECOMMAND FIELDS*/

class _CreateTableCommandname extends GeneratedReflectedField<CreateTableCommand, String> {
  const _CreateTableCommandname();
  @override
  List get annotations => const [];

  @override
  String get name => 'name';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  String? get defaulValue => null;

  @override
  String getReservedValue({required CreateTableCommand? entity}) => entity!.name;
}

class _CreateTableCommandcolumns extends GeneratedReflectedField<CreateTableCommand, List<ColumnAttributes>> {
  const _CreateTableCommandcolumns();
  @override
  List get annotations => const [];

  @override
  String get name => 'columns';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List<ColumnAttributes>? get defaulValue => null;

  @override
  List<ColumnAttributes> getReservedValue({required CreateTableCommand? entity}) => entity!.columns;
}

class _CreateTableCommandprimaryKeyGroups extends GeneratedReflectedField<CreateTableCommand, List<List<String>>> {
  const _CreateTableCommandprimaryKeyGroups();
  @override
  List get annotations => const [];

  @override
  String get name => 'primaryKeyGroups';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List<List<String>>? get defaulValue => null;

  @override
  List<List<String>> getReservedValue({required CreateTableCommand? entity}) => entity!.primaryKeyGroups;
}

class _CreateTableCommanduniqueKeyGroups extends GeneratedReflectedField<CreateTableCommand, List<List<String>>> {
  const _CreateTableCommanduniqueKeyGroups();
  @override
  List get annotations => const [];

  @override
  String get name => 'uniqueKeyGroups';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List<List<String>>? get defaulValue => null;

  @override
  List<List<String>> getReservedValue({required CreateTableCommand? entity}) => entity!.uniqueKeyGroups;
}

class _CreateTableCommandforeignKeys extends GeneratedReflectedField<CreateTableCommand, List<ForeignKey>> {
  const _CreateTableCommandforeignKeys();
  @override
  List get annotations => const [];

  @override
  String get name => 'foreignKeys';

  @override
  bool get isStatic => false;

  @override
  bool get isConst => false;

  @override
  bool get isLate => false;

  @override
  bool get isFinal => true;

  @override
  bool get acceptNull => false;

  @override
  bool get hasDefaultValue => false;
  @override
  List<ForeignKey>? get defaulValue => null;

  @override
  List<ForeignKey> getReservedValue({required CreateTableCommand? entity}) => entity!.foreignKeys;
}

/*CREATETABLECOMMAND METHODS*/

class _CreateTableCommandBuilder extends GeneratedReflectedMethod<CreateTableCommand, CreateTableCommand> {
  const _CreateTableCommandBuilder();
  @override
  String get name => '';

  @override
  bool get isStatic => true;

  @override
  MethodDetectedType get methodType => MethodDetectedType.buildMethod;

  @override
  List get annotations => const [];

  static const _namname = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'name',
  );
  static const _namcolumns = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'columns',
  );
  static const _namprimaryKeyGroups = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'primaryKeyGroups',
  );
  static const _namuniqueKeyGroups = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'uniqueKeyGroups',
  );
  static const _namforeignKeys = GeneratedReflectedNamedParameter<dynamic>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'foreignKeys',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namname, _namcolumns, _namprimaryKeyGroups, _namuniqueKeyGroups, _namforeignKeys];

  @override
  CreateTableCommand callReservedMethod({required CreateTableCommand? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => CreateTableCommand(
        name: _namname.getValueFromMap(namedValues),
        columns: _namcolumns.getValueFromMap(namedValues),
        primaryKeyGroups: _namprimaryKeyGroups.getValueFromMap(namedValues),
        uniqueKeyGroups: _namuniqueKeyGroups.getValueFromMap(namedValues),
        foreignKeys: _namforeignKeys.getValueFromMap(namedValues),
      );
}

/*CREATETABLECOMMAND INSTANCE*/

class _CreateTableCommand extends GeneratedReflectedClass<CreateTableCommand> {
  const _CreateTableCommand();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [IDataBaseCommand];

  @override
  bool get isAbstract => false;

  @override
  bool get isMixin => false;

  @override
  String get name => 'CreateTableCommand';

  @override
  List<GeneratedReflectedMethod> get methods => const [_CreateTableCommandBuilder()];

  @override
  List<GeneratedReflectedField> get fields =>
      const [_CreateTableCommandname(), _CreateTableCommandcolumns(), _CreateTableCommandprimaryKeyGroups(), _CreateTableCommanduniqueKeyGroups(), _CreateTableCommandforeignKeys()];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class IDataBaseEngineCapabilities   ----------------------------------*/

/*IDATABASEENGINECAPABILITIES FIELDS*/

/*IDATABASEENGINECAPABILITIES METHODS*/

class _IDataBaseEngineCapabilitiesexecuteCommandMethod extends GeneratedReflectedMethod<IDataBaseEngineCapabilities, Future<void>> {
  const _IDataBaseEngineCapabilitiesexecuteCommandMethod();
  @override
  String get name => 'executeCommand';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namcommand = GeneratedReflectedNamedParameter<IDataBaseCommand>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'command',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namcommand];

  @override
  Future<void> callReservedMethod({required IDataBaseEngineCapabilities? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.executeCommand(
        command: _namcommand.getValueFromMap(namedValues),
      );
}

class _IDataBaseEngineCapabilitiesexecuteQueryMethod extends GeneratedReflectedMethod<IDataBaseEngineCapabilities, Future<TableResult>> {
  const _IDataBaseEngineCapabilitiesexecuteQueryMethod();
  @override
  String get name => 'executeQuery';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namcommand = GeneratedReflectedNamedParameter<QueryCommand>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'command',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namcommand];

  @override
  Future<TableResult> callReservedMethod({required IDataBaseEngineCapabilities? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.executeQuery(
        command: _namcommand.getValueFromMap(namedValues),
      );
}

class _IDataBaseEngineCapabilitiesgetTableColumnsNameMethod extends GeneratedReflectedMethod<IDataBaseEngineCapabilities, Future<List<String>>> {
  const _IDataBaseEngineCapabilitiesgetTableColumnsNameMethod();
  @override
  String get name => 'getTableColumnsName';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namtableName = GeneratedReflectedNamedParameter<String>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'tableName',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namtableName];

  @override
  Future<List<String>> callReservedMethod({required IDataBaseEngineCapabilities? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.getTableColumnsName(
        tableName: _namtableName.getValueFromMap(namedValues),
      );
}

class _IDataBaseEngineCapabilitiescheckTableExistsMethod extends GeneratedReflectedMethod<IDataBaseEngineCapabilities, Future<bool>> {
  const _IDataBaseEngineCapabilitiescheckTableExistsMethod();
  @override
  String get name => 'checkTableExists';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namtableName = GeneratedReflectedNamedParameter<String>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'tableName',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namtableName];

  @override
  Future<bool> callReservedMethod({required IDataBaseEngineCapabilities? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.checkTableExists(
        tableName: _namtableName.getValueFromMap(namedValues),
      );
}

class _IDataBaseEngineCapabilitiesdeleteTableMethod extends GeneratedReflectedMethod<IDataBaseEngineCapabilities, Future<void>> {
  const _IDataBaseEngineCapabilitiesdeleteTableMethod();
  @override
  String get name => 'deleteTable';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namtableName = GeneratedReflectedNamedParameter<String>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'tableName',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namtableName];

  @override
  Future<void> callReservedMethod({required IDataBaseEngineCapabilities? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.deleteTable(
        tableName: _namtableName.getValueFromMap(namedValues),
      );
}

class _IDataBaseEngineCapabilitiesexecuteFunctionAsTransactionMethod extends GeneratedReflectedMethod<IDataBaseEngineCapabilities, Future<void>> {
  const _IDataBaseEngineCapabilitiesexecuteFunctionAsTransactionMethod();
  @override
  String get name => 'executeFunctionAsTransaction';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namfunction = GeneratedReflectedNamedParameter<Future<bool> Function(IDataBaseEngineCapabilities)>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'function',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namfunction];

  @override
  Future<void> callReservedMethod({required IDataBaseEngineCapabilities? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.executeFunctionAsTransaction(
        function: _namfunction.getValueFromMap(namedValues),
      );
}

class _IDataBaseEngineCapabilitiesexecuteQueryAsTransactionMethod extends GeneratedReflectedMethod<IDataBaseEngineCapabilities, Future<TableResult?>> {
  const _IDataBaseEngineCapabilitiesexecuteQueryAsTransactionMethod();
  @override
  String get name => 'executeQueryAsTransaction';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namfunction = GeneratedReflectedNamedParameter<Future<TableResult?> Function(IDataBaseEngineCapabilities)>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'function',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namfunction];

  @override
  Future<TableResult?> callReservedMethod({required IDataBaseEngineCapabilities? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.executeQueryAsTransaction(
        function: _namfunction.getValueFromMap(namedValues),
      );
}

class _IDataBaseEngineCapabilitiesreserveEngineMethod extends GeneratedReflectedMethod<IDataBaseEngineCapabilities, Future> {
  const _IDataBaseEngineCapabilitiesreserveEngineMethod();
  @override
  String get name => 'reserveEngine';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namfunction = GeneratedReflectedNamedParameter<Future Function(IDataBaseEngineCapabilities)>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'function',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namfunction];

  @override
  Future callReservedMethod({required IDataBaseEngineCapabilities? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.reserveEngine(
        function: _namfunction.getValueFromMap(namedValues),
      );
}

/*IDATABASEENGINECAPABILITIES INSTANCE*/

class _IDataBaseEngineCapabilities extends GeneratedReflectedClass<IDataBaseEngineCapabilities> {
  const _IDataBaseEngineCapabilities();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [];

  @override
  bool get isAbstract => true;

  @override
  bool get isMixin => true;

  @override
  String get name => 'IDataBaseEngineCapabilities';

  @override
  List<GeneratedReflectedMethod> get methods => const [
        _IDataBaseEngineCapabilitiesexecuteCommandMethod(),
        _IDataBaseEngineCapabilitiesexecuteQueryMethod(),
        _IDataBaseEngineCapabilitiesgetTableColumnsNameMethod(),
        _IDataBaseEngineCapabilitiescheckTableExistsMethod(),
        _IDataBaseEngineCapabilitiesdeleteTableMethod(),
        _IDataBaseEngineCapabilitiesexecuteFunctionAsTransactionMethod(),
        _IDataBaseEngineCapabilitiesexecuteQueryAsTransactionMethod(),
        _IDataBaseEngineCapabilitiesreserveEngineMethod()
      ];

  @override
  List<GeneratedReflectedField> get fields => const [];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class IDataBaseEngine   ----------------------------------*/

/*IDATABASEENGINE FIELDS*/

/*IDATABASEENGINE METHODS*/

class _IDataBaseEngineserializeToDatabaseMethod extends GeneratedReflectedMethod<IDataBaseEngine, dynamic> {
  const _IDataBaseEngineserializeToDatabaseMethod();
  @override
  String get name => 'serializeToDatabase';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _fix0 = GeneratedReflectedFixedParameter<dynamic>(
    annotations: const [],
    name: 'item',
    position: 0,
    hasDefaultValue: false,
    defaultValue: null,
    acceptNulls: false,
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [_fix0];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [];

  @override
  dynamic callReservedMethod({required IDataBaseEngine? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.serializeToDatabase(
        _fix0.getValueFromList(fixedValues),
      );
}

class _IDataBaseEngineserializeMapToDatabaseMethod extends GeneratedReflectedMethod<IDataBaseEngine, Map<String, dynamic>> {
  const _IDataBaseEngineserializeMapToDatabaseMethod();
  @override
  String get name => 'serializeMapToDatabase';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _fix0 = GeneratedReflectedFixedParameter<Map<String, dynamic>>(
    annotations: const [],
    name: 'original',
    position: 0,
    hasDefaultValue: false,
    defaultValue: null,
    acceptNulls: false,
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [_fix0];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [];

  @override
  Map<String, dynamic> callReservedMethod({required IDataBaseEngine? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.serializeMapToDatabase(
        _fix0.getValueFromList(fixedValues),
      );
}

class _IDataBaseEngineserializeListToDatabaseMethod extends GeneratedReflectedMethod<IDataBaseEngine, List> {
  const _IDataBaseEngineserializeListToDatabaseMethod();
  @override
  String get name => 'serializeListToDatabase';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _fix0 = GeneratedReflectedFixedParameter<List>(
    annotations: const [],
    name: 'original',
    position: 0,
    hasDefaultValue: false,
    defaultValue: null,
    acceptNulls: false,
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [_fix0];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [];

  @override
  List callReservedMethod({required IDataBaseEngine? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.serializeListToDatabase(
        _fix0.getValueFromList(fixedValues),
      );
}

/*IDATABASEENGINE INSTANCE*/

class _IDataBaseEngine extends GeneratedReflectedClass<IDataBaseEngine> {
  const _IDataBaseEngine();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [IDataBaseEngineCapabilities];

  @override
  bool get isAbstract => true;

  @override
  bool get isMixin => true;

  @override
  String get name => 'IDataBaseEngine';

  @override
  List<GeneratedReflectedMethod> get methods => const [_IDataBaseEngineserializeToDatabaseMethod(), _IDataBaseEngineserializeMapToDatabaseMethod(), _IDataBaseEngineserializeListToDatabaseMethod()];

  @override
  List<GeneratedReflectedField> get fields => const [];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class IMultiDatabaseEngine   ----------------------------------*/

/*IMULTIDATABASEENGINE FIELDS*/

/*IMULTIDATABASEENGINE METHODS*/

class _IMultiDatabaseEnginecheckDatabaseExistsMethod extends GeneratedReflectedMethod<IMultiDatabaseEngine, Future<bool>> {
  const _IMultiDatabaseEnginecheckDatabaseExistsMethod();
  @override
  String get name => 'checkDatabaseExists';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namdatabaseName = GeneratedReflectedNamedParameter<String>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'databaseName',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namdatabaseName];

  @override
  Future<bool> callReservedMethod({required IMultiDatabaseEngine? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.checkDatabaseExists(
        databaseName: _namdatabaseName.getValueFromMap(namedValues),
      );
}

class _IMultiDatabaseEnginecreateDatabaseMethod extends GeneratedReflectedMethod<IMultiDatabaseEngine, Future<void>> {
  const _IMultiDatabaseEnginecreateDatabaseMethod();
  @override
  String get name => 'createDatabase';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namdatabaseName = GeneratedReflectedNamedParameter<String>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'databaseName',
  );
  static const _namomitIfExists = GeneratedReflectedNamedParameter<bool>(
    annotations: const [],
    defaultValue: true,
    hasDefaultValue: true,
    acceptNulls: false,
    name: 'omitIfExists',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namdatabaseName, _namomitIfExists];

  @override
  Future<void> callReservedMethod({required IMultiDatabaseEngine? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.createDatabase(
        databaseName: _namdatabaseName.getValueFromMap(namedValues),
        omitIfExists: _namomitIfExists.getValueFromMap(namedValues),
      );
}

class _IMultiDatabaseEnginedeleteDatabaseMethod extends GeneratedReflectedMethod<IMultiDatabaseEngine, Future<void>> {
  const _IMultiDatabaseEnginedeleteDatabaseMethod();
  @override
  String get name => 'deleteDatabase';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namdatabaseName = GeneratedReflectedNamedParameter<String>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'databaseName',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namdatabaseName];

  @override
  Future<void> callReservedMethod({required IMultiDatabaseEngine? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.deleteDatabase(
        databaseName: _namdatabaseName.getValueFromMap(namedValues),
      );
}

/*IMULTIDATABASEENGINE INSTANCE*/

class _IMultiDatabaseEngine extends GeneratedReflectedClass<IMultiDatabaseEngine> {
  const _IMultiDatabaseEngine();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [IDataBaseEngineCapabilities, IDataBaseEngine];

  @override
  bool get isAbstract => true;

  @override
  bool get isMixin => true;

  @override
  String get name => 'IMultiDatabaseEngine';

  @override
  List<GeneratedReflectedMethod> get methods => const [_IMultiDatabaseEnginecheckDatabaseExistsMethod(), _IMultiDatabaseEnginecreateDatabaseMethod(), _IMultiDatabaseEnginedeleteDatabaseMethod()];

  @override
  List<GeneratedReflectedField> get fields => const [];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class DataBaseEngineTemplate   ----------------------------------*/

/*DATABASEENGINETEMPLATE FIELDS*/

/*DATABASEENGINETEMPLATE METHODS*/

class _DataBaseEngineTemplateinTransactionGetter extends GeneratedReflectedMethod<DataBaseEngineTemplate, bool> {
  const _DataBaseEngineTemplateinTransactionGetter();
  @override
  String get name => 'inTransaction';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.getMehtod;

  @override
  List get annotations => const [];

  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [];

  @override
  bool callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.inTransaction;
}

class _DataBaseEngineTemplatecreateTransactionMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<void>> {
  const _DataBaseEngineTemplatecreateTransactionMethod();
  @override
  String get name => 'createTransaction';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [];

  @override
  Future<void> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.createTransaction();
}

class _DataBaseEngineTemplatecommitTransactionMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<void>> {
  const _DataBaseEngineTemplatecommitTransactionMethod();
  @override
  String get name => 'commitTransaction';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [];

  @override
  Future<void> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.commitTransaction();
}

class _DataBaseEngineTemplaterollbackTransactionMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<void>> {
  const _DataBaseEngineTemplaterollbackTransactionMethod();
  @override
  String get name => 'rollbackTransaction';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [];

  @override
  Future<void> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.rollbackTransaction();
}

class _DataBaseEngineTemplateprepareEngineMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<void>> {
  const _DataBaseEngineTemplateprepareEngineMethod();
  @override
  String get name => 'prepareEngine';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [];

  @override
  Future<void> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.prepareEngine();
}

class _DataBaseEngineTemplatereleaseEngineMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<void>> {
  const _DataBaseEngineTemplatereleaseEngineMethod();
  @override
  String get name => 'releaseEngine';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [];

  @override
  Future<void> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.releaseEngine();
}

class _DataBaseEngineTemplatecheckTableExistsMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<bool>> {
  const _DataBaseEngineTemplatecheckTableExistsMethod();
  @override
  String get name => 'checkTableExists';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [override];

  static const _namtableName = GeneratedReflectedNamedParameter<String>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'tableName',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namtableName];

  @override
  Future<bool> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.checkTableExists(
        tableName: _namtableName.getValueFromMap(namedValues),
      );
}

class _DataBaseEngineTemplatecheckTableExistsDirectlyMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<bool>> {
  const _DataBaseEngineTemplatecheckTableExistsDirectlyMethod();
  @override
  String get name => 'checkTableExistsDirectly';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namtableName = GeneratedReflectedNamedParameter<String>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'tableName',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namtableName];

  @override
  Future<bool> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.checkTableExistsDirectly(
        tableName: _namtableName.getValueFromMap(namedValues),
      );
}

class _DataBaseEngineTemplatedeleteTableMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<void>> {
  const _DataBaseEngineTemplatedeleteTableMethod();
  @override
  String get name => 'deleteTable';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [override];

  static const _namtableName = GeneratedReflectedNamedParameter<String>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'tableName',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namtableName];

  @override
  Future<void> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.deleteTable(
        tableName: _namtableName.getValueFromMap(namedValues),
      );
}

class _DataBaseEngineTemplatedeleteTableDirectlyMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<void>> {
  const _DataBaseEngineTemplatedeleteTableDirectlyMethod();
  @override
  String get name => 'deleteTableDirectly';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namtableName = GeneratedReflectedNamedParameter<String>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'tableName',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namtableName];

  @override
  Future<void> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.deleteTableDirectly(
        tableName: _namtableName.getValueFromMap(namedValues),
      );
}

class _DataBaseEngineTemplateexecuteCommandMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<void>> {
  const _DataBaseEngineTemplateexecuteCommandMethod();
  @override
  String get name => 'executeCommand';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [override];

  static const _namcommand = GeneratedReflectedNamedParameter<IDataBaseCommand>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'command',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namcommand];

  @override
  Future<void> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.executeCommand(
        command: _namcommand.getValueFromMap(namedValues),
      );
}

class _DataBaseEngineTemplateexecuteCommandDirectlyMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<void>> {
  const _DataBaseEngineTemplateexecuteCommandDirectlyMethod();
  @override
  String get name => 'executeCommandDirectly';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namcommand = GeneratedReflectedNamedParameter<IDataBaseCommand>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'command',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namcommand];

  @override
  Future<void> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.executeCommandDirectly(
        command: _namcommand.getValueFromMap(namedValues),
      );
}

class _DataBaseEngineTemplateexecuteQueryMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<TableResult>> {
  const _DataBaseEngineTemplateexecuteQueryMethod();
  @override
  String get name => 'executeQuery';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [override];

  static const _namcommand = GeneratedReflectedNamedParameter<QueryCommand>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'command',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namcommand];

  @override
  Future<TableResult> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.executeQuery(
        command: _namcommand.getValueFromMap(namedValues),
      );
}

class _DataBaseEngineTemplateexecuteQueryDirectlyMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<TableResult>> {
  const _DataBaseEngineTemplateexecuteQueryDirectlyMethod();
  @override
  String get name => 'executeQueryDirectly';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namcommand = GeneratedReflectedNamedParameter<QueryCommand>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'command',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namcommand];

  @override
  Future<TableResult> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.executeQueryDirectly(
        command: _namcommand.getValueFromMap(namedValues),
      );
}

class _DataBaseEngineTemplateexecuteFunctionAsTransactionMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<void>> {
  const _DataBaseEngineTemplateexecuteFunctionAsTransactionMethod();
  @override
  String get name => 'executeFunctionAsTransaction';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [override];

  static const _namfunction = GeneratedReflectedNamedParameter<Future<bool> Function(IDataBaseEngineCapabilities)>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'function',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namfunction];

  @override
  Future<void> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.executeFunctionAsTransaction(
        function: _namfunction.getValueFromMap(namedValues),
      );
}

class _DataBaseEngineTemplateexecuteFunctionAsTransactionDirectlyMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<bool>> {
  const _DataBaseEngineTemplateexecuteFunctionAsTransactionDirectlyMethod();
  @override
  String get name => 'executeFunctionAsTransactionDirectly';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namfunction = GeneratedReflectedNamedParameter<Future<bool> Function(IDataBaseEngineCapabilities)>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'function',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namfunction];

  @override
  Future<bool> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.executeFunctionAsTransactionDirectly(
        function: _namfunction.getValueFromMap(namedValues),
      );
}

class _DataBaseEngineTemplateexecuteQueryAsTransactionMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<TableResult?>> {
  const _DataBaseEngineTemplateexecuteQueryAsTransactionMethod();
  @override
  String get name => 'executeQueryAsTransaction';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [override];

  static const _namfunction = GeneratedReflectedNamedParameter<Future<TableResult?> Function(IDataBaseEngineCapabilities p1)>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'function',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namfunction];

  @override
  Future<TableResult?> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.executeQueryAsTransaction(
        function: _namfunction.getValueFromMap(namedValues),
      );
}

class _DataBaseEngineTemplategetTableColumnsNameMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<List<String>>> {
  const _DataBaseEngineTemplategetTableColumnsNameMethod();
  @override
  String get name => 'getTableColumnsName';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [override];

  static const _namtableName = GeneratedReflectedNamedParameter<String>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'tableName',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namtableName];

  @override
  Future<List<String>> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.getTableColumnsName(
        tableName: _namtableName.getValueFromMap(namedValues),
      );
}

class _DataBaseEngineTemplategetTableColumnsNameDirectlyMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future<List<String>>> {
  const _DataBaseEngineTemplategetTableColumnsNameDirectlyMethod();
  @override
  String get name => 'getTableColumnsNameDirectly';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  static const _namtableName = GeneratedReflectedNamedParameter<String>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'tableName',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namtableName];

  @override
  Future<List<String>> callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.getTableColumnsNameDirectly(
        tableName: _namtableName.getValueFromMap(namedValues),
      );
}

class _DataBaseEngineTemplatereserveEngineMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future> {
  const _DataBaseEngineTemplatereserveEngineMethod();
  @override
  String get name => 'reserveEngine';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [override];

  static const _namfunction = GeneratedReflectedNamedParameter<Future Function(IDataBaseEngineCapabilities p1)>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'function',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namfunction];

  @override
  Future callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.reserveEngine(
        function: _namfunction.getValueFromMap(namedValues),
      );
}

class _DataBaseEngineTemplateinternalReserveEngineMethod extends GeneratedReflectedMethod<DataBaseEngineTemplate, Future> {
  const _DataBaseEngineTemplateinternalReserveEngineMethod();
  @override
  String get name => 'internalReserveEngine';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [protected];

  static const _namfunction = GeneratedReflectedNamedParameter<Future Function()>(
    annotations: const [],
    defaultValue: null,
    hasDefaultValue: false,
    acceptNulls: false,
    name: 'function',
  );
  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [_namfunction];

  @override
  Future callReservedMethod({required DataBaseEngineTemplate? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.internalReserveEngine(
        function: _namfunction.getValueFromMap(namedValues),
      );
}

/*DATABASEENGINETEMPLATE INSTANCE*/

class _DataBaseEngineTemplate extends GeneratedReflectedClass<DataBaseEngineTemplate> {
  const _DataBaseEngineTemplate();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [IDataBaseEngineCapabilities, IDataBaseEngine];

  @override
  bool get isAbstract => true;

  @override
  bool get isMixin => false;

  @override
  String get name => 'DataBaseEngineTemplate';

  @override
  List<GeneratedReflectedMethod> get methods => const [
        _DataBaseEngineTemplateinTransactionGetter(),
        _DataBaseEngineTemplatecreateTransactionMethod(),
        _DataBaseEngineTemplatecommitTransactionMethod(),
        _DataBaseEngineTemplaterollbackTransactionMethod(),
        _DataBaseEngineTemplateprepareEngineMethod(),
        _DataBaseEngineTemplatereleaseEngineMethod(),
        _DataBaseEngineTemplatecheckTableExistsMethod(),
        _DataBaseEngineTemplatecheckTableExistsDirectlyMethod(),
        _DataBaseEngineTemplatedeleteTableMethod(),
        _DataBaseEngineTemplatedeleteTableDirectlyMethod(),
        _DataBaseEngineTemplateexecuteCommandMethod(),
        _DataBaseEngineTemplateexecuteCommandDirectlyMethod(),
        _DataBaseEngineTemplateexecuteQueryMethod(),
        _DataBaseEngineTemplateexecuteQueryDirectlyMethod(),
        _DataBaseEngineTemplateexecuteFunctionAsTransactionMethod(),
        _DataBaseEngineTemplateexecuteFunctionAsTransactionDirectlyMethod(),
        _DataBaseEngineTemplateexecuteQueryAsTransactionMethod(),
        _DataBaseEngineTemplategetTableColumnsNameMethod(),
        _DataBaseEngineTemplategetTableColumnsNameDirectlyMethod(),
        _DataBaseEngineTemplatereserveEngineMethod(),
        _DataBaseEngineTemplateinternalReserveEngineMethod()
      ];

  @override
  List<GeneratedReflectedField> get fields => const [];
}
/*----------------------------------   x   ----------------------------------*/

/*----------------------------------   Class IDataBaseConfiguration   ----------------------------------*/

/*IDATABASECONFIGURATION FIELDS*/

/*IDATABASECONFIGURATION METHODS*/

class _IDataBaseConfigurationgenerateEngineMethod extends GeneratedReflectedMethod<IDataBaseConfiguration, IDataBaseEngine> {
  const _IDataBaseConfigurationgenerateEngineMethod();
  @override
  String get name => 'generateEngine';

  @override
  bool get isStatic => false;

  @override
  MethodDetectedType get methodType => MethodDetectedType.commonMethod;

  @override
  List get annotations => const [];

  @override
  List<GeneratedReflectedFixedParameter> get fixedParameters => const [];

  @override
  List<GeneratedReflectedNamedParameter> get namedParameters => const [];

  @override
  IDataBaseEngine callReservedMethod({required IDataBaseConfiguration? entity, required List fixedValues, required Map<String, dynamic> namedValues}) => entity!.generateEngine();
}

/*IDATABASECONFIGURATION INSTANCE*/

class _IDataBaseConfiguration extends GeneratedReflectedClass<IDataBaseConfiguration> {
  const _IDataBaseConfiguration();
  @override
  List get annotations => const [reflect];

  @override
  Type? get baseClass => null;

  @override
  List<Type> get classThatImplement => const [];

  @override
  bool get isAbstract => true;

  @override
  bool get isMixin => true;

  @override
  String get name => 'IDataBaseConfiguration';

  @override
  List<GeneratedReflectedMethod> get methods => const [_IDataBaseConfigurationgenerateEngineMethod()];

  @override
  List<GeneratedReflectedField> get fields => const [];
}
/*----------------------------------   x   ----------------------------------*/

class _AlbumMaxiLibraryDbReflectors extends GeneratedReflectorAlbum {
  const _AlbumMaxiLibraryDbReflectors();
  @override
  List<GeneratedReflectedClass> get classes => const [
        _QueryField(),
        _QueryOrder(),
        _QueryJoiner(),
        _ColumnAttributes(),
        _QueryTable(),
        _ForeignKey(),
        _CompareFields(),
        _CompareValue(),
        _CompareSimilarText(),
        _CompareIncludesValues(),
        _CompareMultipleComparisons(),
        _QueryCommand(),
        _AggregatorCommand(),
        _ModifierCommand(),
        _DeleteCommand(),
        _IConditionQuery(),
        _CreateTableCommand(),
        _IDataBaseEngineCapabilities(),
        _IDataBaseEngine(),
        _IMultiDatabaseEngine(),
        _DataBaseEngineTemplate(),
        _IDataBaseConfiguration()
      ];

  @override
  List<TypeEnumeratorReflector> get enums => const [_QueryFieldTypeEnum(), _QueryJoinerTypeEnum(), _ColumnAttributesTypeEnum(), _CompareMultipleComparisonsLogicEnum(), _ConditionCompareTypeEnum()];
}

const maxiLibraryDbReflectors = _AlbumMaxiLibraryDbReflectors();
