import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/src/engines/interfaces/idatabase_engine_capabilities.dart';

mixin IDataBaseEngine on IDataBaseEngineCapabilities {
  Future<void> executeCommandAsTransaction({required Future<bool> Function(IDataBaseEngineCapabilities) function});
  Future<TableResult?> executeQueryAsTransaction({required Future<TableResult?> Function(IDataBaseEngineCapabilities) function});

  Future<T> reserveEngine<T>({required Future<T> Function(IDataBaseEngineCapabilities) function});

  dynamic serializeToDatabase(dynamic item);

  Map<String, dynamic> serializeMapToDatabase(Map<String, dynamic> original) {
    final newMap = <String, dynamic>{};

    for (final item in original.entries) {
      newMap[item.key] = serializeToDatabase(item.value);
    }

    return newMap;
  }

  List serializeListToDatabase(List original) {
    final newList = [];

    for (final item in original) {
      newList.add(serializeToDatabase(item));
    }

    return newList;
  }
}
