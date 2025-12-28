import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/app/controller/quit_app.controller.dart';

class QuitCommand extends LeafCommand<void> {
  @override
  String get name => 'quit';

  @override
  String get description => 'Exit the application';

  @override
  Controller<void> get controller {
    return QuitAppController();
  }

  QuitCommand();

  @override
  void mapArguments(Map<String, dynamic> args) {}
}
