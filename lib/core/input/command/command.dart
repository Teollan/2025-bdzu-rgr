import 'package:args/command_runner.dart';
import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/argument/argument_schema.dart';

class LeafCommand<T> extends Command<void> {
  final String _name;
  final String _description;
  final Controller<T> controller;
  final ArgumentSchema<T> argumentSchema;

  @override
  String get name => _name;

  @override
  String get description => _description;

  LeafCommand({
    required String name,
    required String description,
    required this.controller,
    required this.argumentSchema,
  }) : _name = name,
       _description = description {
    for (final entry in argumentSchema.arguments.entries) {
      final name = entry.key;
      final argument = entry.value;

      addArgument(name, argument);
    }
  }

  @override
  Future<void> run() async {
    final parsedArgs = argumentSchema.parse(argResults!);

    await controller.run(parsedArgs);
  }

  void addArgument(String name, Argument<dynamic> argument) {
    if (argument is Argument<bool>) {
      argParser.addFlag(
        name,
        help: argument.help,
        defaultsTo: argument.defaultValue ?? false,
      );
    } else {
      argParser.addOption(
        name,
        help: argument.help,
        defaultsTo: argument.defaultValue?.toString(),
        mandatory: argument.isRequired,
      );
    }
  }
}

class BranchCommand extends Command<void> {
  final String _name;
  final String _description;

  @override
  String get name => _name;

  @override
  String get description => _description;

  BranchCommand({required String name, required String description})
    : _name = name,
      _description = description;
}
