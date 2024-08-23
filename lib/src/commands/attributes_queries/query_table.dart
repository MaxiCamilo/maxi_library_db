import 'package:maxi_library_db/src/reflection/reflection_implementation.dart';

@reflectByMaxiLibraryDb
class QueryTable {
  final String fieldName;
  final String nickName;

  const QueryTable({required this.fieldName, this.nickName = ''});
}
