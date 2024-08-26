import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
mixin IDataBaseEngine on IDataBaseEngineCapabilities {
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
