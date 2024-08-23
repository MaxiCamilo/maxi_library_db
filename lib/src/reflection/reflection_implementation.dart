import 'package:maxi_library/maxi_library.dart';

export 'package:maxi_library_db/maxi_library_db.dart';

class ReflectByMaxiLibraryDbImplementation extends Reflectable {
  const ReflectByMaxiLibraryDbImplementation()
      : super(
          invokingCapability,
          declarationsCapability,
          typeCapability,
          typingCapability,
          typeRelationsCapability,
          subtypeQuantifyCapability,
          reflectedTypeCapability,
        );
}

const reflectByMaxiLibraryDb = ReflectByMaxiLibraryDbImplementation();
void main(List<String> args) {}
