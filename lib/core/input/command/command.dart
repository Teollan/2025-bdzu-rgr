import 'package:args/command_runner.dart';
import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';

abstract class LeafCommand<T> extends Command<void> {
  final List<Argument<dynamic>> arguments = [];

  @override
  String get name;

  @override
  String get description;

  Controller<T> get controller;

  @override
  Future<void> run() async {
    final parsed = parseArguments();
    final args = mapArguments(parsed);

    await controller.run(args);
  }

  T mapArguments(Map<String, dynamic> args);

  Map<String, dynamic> parseArguments() {
    final parsed = <String, dynamic>{};

    for (final argument in arguments) {
      final input = argument is Argument<bool>
          ? argResults!.flag(argument.name).toString()
          : argResults!.option(argument.name);

      final value = argument.parseAndValidate(input);

      parsed[argument.name] = value;
    }

    return parsed;
  }

  void addArgument(Argument<dynamic> argument) {
    arguments.add(argument);

    if (argument is Argument<bool>) {
      argParser.addFlag(
        argument.name,
        help: argument.help,
        defaultsTo: argument.defaultValue ?? false,
      );
    } else {
      argParser.addOption(
        argument.name,
        help: argument.help,
        defaultsTo: argument.defaultValue?.toString(),
        mandatory: argument.isRequired,
      );
    }
  }
}

abstract class BranchCommand extends Command<void> {
  @override
  String get name;

  @override
  String get description;
}
