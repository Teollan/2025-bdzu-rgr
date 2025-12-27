import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:rgr/core/database/database.dart';
import 'package:rgr/core/database/postgres.dart';
import 'package:rgr/core/environment/environment.dart';
import 'package:rgr/modules/company/view/commands/index.dart';

class App {
  static bool isRunning = false;
  static CommandRunner<void> runner = App.buildRunner();

  static Future<void> init() async {
    await PostgresDatabase().connect(
      DatabaseConnectionParameters(
        host: Environment.dbHost,
        port: Environment.dbPort,
        database: Environment.dbName,
        username: Environment.dbUsername,
        password: Environment.dbPassword,
      ),
    );

    stdout.writeln('Database initialized.');
  }

  static Future<void> run() async {
    await init();

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
    final runner = CommandRunner<void>('>', 'A command-line CRM application.');

    runner.addCommand(buildCompaniesCommands());

    return runner;
  }
}
