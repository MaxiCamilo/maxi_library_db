import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
mixin IDataBaseConfiguration {
  IDataBaseEngine generateEngine();
}
