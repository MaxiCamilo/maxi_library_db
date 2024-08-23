import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
class QueryOrder {
  final List<String> fields;
  final bool isAscendent;

  const QueryOrder({required this.fields, required this.isAscendent});
}
