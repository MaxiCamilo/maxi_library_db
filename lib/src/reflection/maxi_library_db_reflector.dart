import 'package:maxi_library/maxi_library.dart';

import 'reflection_implementation.dart' as reflectable;
import 'reflection_implementation.reflectable.dart' as generated;

class MaxiLibraryDbReflector extends ReflectorInstance {
  const MaxiLibraryDbReflector({
    super.initializeReflectableFunction = generated.initializeReflectable,
    super.instanceClass = reflectable.reflectByMaxiLibraryDb,
  });
}
