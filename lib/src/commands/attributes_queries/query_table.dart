import 'package:maxi_library/maxi_library.dart';

@reflect
class QueryTable {
  final String fieldName;
  final String nickName;

  const QueryTable({required this.fieldName, this.nickName = ''});
}
