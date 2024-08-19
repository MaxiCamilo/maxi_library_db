import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/src/engines/interfaces/idatabase_engine_capabilities.dart';

mixin IDatabaseEngine on IDatabaseEngineCapabilities {
  Future<void> executeCommandAsTransaction({required Future<bool> Function(IDatabaseEngineCapabilities) function});
  Future<TableResult?> executeQueryAsTransaction({required Future<TableResult?> Function(IDatabaseEngineCapabilities) function});

  Future<void> reserveEngine({required Future<void> Function(IDatabaseEngineCapabilities) function});
}
