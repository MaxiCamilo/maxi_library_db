import 'package:maxi_library/maxi_library.dart';
import 'package:maxi_library_db/maxi_library_db.dart';

@reflect
mixin IDataBaseConfiguration {
  IDataBaseEngine generateEngine();
}
