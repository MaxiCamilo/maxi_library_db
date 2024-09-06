import 'package:maxi_library/maxi_library.dart';

@reflect
class QueryOrder {
  final List<String> fields;
  final bool isAscendent;

  const QueryOrder({required this.fields, required this.isAscendent});
}
