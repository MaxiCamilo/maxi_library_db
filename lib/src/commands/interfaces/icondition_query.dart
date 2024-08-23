import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
enum ConditionCompareType { equal, notEqual, greater, less, greaterEqual, lessEqual }

@reflectByMaxiLibraryDb
mixin IConditionQuery {}
