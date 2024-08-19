import 'package:maxi_library_db/maxi_library_db.dart';

mixin ICommandsAdapter<R> {
  R generateCommandForEngine({required IDatabaseCommand command});

  R generateAgregatorCommandForEngine({required AggregatorCommand command});

  R generateDeleteCommandForEngine({required DeleteCommand command});

  R generateModifierCommandForEngine({required ModifierCommand command});




}
