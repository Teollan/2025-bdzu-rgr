import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:rgr/modules/company/view/commands/index.dart';

class App {
  static bool isRunning = false;
  static CommandRunner<void> runner = App.buildRunner();

  static void run() async {
    isRunning = true;

    while (isRunning) {
      final command = readCommand();

      if (command != null) {
        await runCommand(command);
      }
    }
  }

  static String? readCommand() {
    stdout.write('> ');

    final rawInput = stdin.readLineSync();

    if (rawInput == null) {
      return null;
    }

    final trimmedInput = rawInput.trim();

    if (trimmedInput.isEmpty) {
      return null;
    }

    return trimmedInput;
  }

  static Future<void> runCommand(String command) async {
    try {
      await runner.run(command.split(' '));
    } catch (e) {
      stdout.writeln('An unexpected error occurred: $e');
    }
  }

  static void kill() {
    isRunning = false;
  }

  static CommandRunner<void> buildRunner() {
    final runner = CommandRunner<void>(
      'run',
      'A command-line application for managing resources.',
    );

    runner.addCommand(buildCompanyCommands());

    return runner;
  }
}
