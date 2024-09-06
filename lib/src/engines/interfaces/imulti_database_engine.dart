import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

@reflect
mixin IMultiDatabaseEngine on IDataBaseEngineCapabilities, IDataBaseEngine {
  Future<bool> checkDatabaseExists({required String databaseName});

  Future<void> createDatabase({required String databaseName, bool omitIfExists = true});
  Future<void> deleteDatabase({required String databaseName});
}
