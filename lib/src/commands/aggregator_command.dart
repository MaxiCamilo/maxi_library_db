import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

@reflect
class AggregatorCommand with IDataBaseCommand {
  final String tableName;
  final Map<String, dynamic> dataField;

  const AggregatorCommand({required this.tableName, required this.dataField});
}
