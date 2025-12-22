import 'package:rgr/core/input/argument/argument.dart';

abstract class Controller {
  final Arguments arguments;

  Controller(this.arguments);

  Future<void> invoke(String args) async {
    await run(arguments.parse(args));
  }

  Future<void> run(Map<String, dynamic> args);
}
