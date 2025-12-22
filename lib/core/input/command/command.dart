import 'package:collection/collection.dart';
import 'package:rgr/core/controller/controller.dart';

abstract class Command {
  Future<void> execute(String rawArgs);
}

class Action extends Command {
  final Controller controller;

  Action(this.controller);

  @override
  Future<void> execute(String rawArgs) async {
    String args = rawArgs.trim();

    await controller.invoke(args);
  }
}

class Fork extends Command {
  final Map<String, Command> commands;

  Fork(this.commands);

  @override
  Future<void> execute(String rawArgs) async {
    final args = rawArgs.trim();

    final nextCommandKey = commands.keys.firstWhereOrNull(
      (commandKey) => args.startsWith(commandKey),
    );

    final nextCommand = commands[nextCommandKey];

    if (nextCommandKey == null || nextCommand == null) {
      throw Error();
    }

    final nextCommandArgs =
        RegExp(
          '^${RegExp.escape(nextCommandKey)}(.*)\$',
        ).matchAsPrefix(args)?.group(1) ??
        '';

    await nextCommand.execute(nextCommandArgs);
  }
}
