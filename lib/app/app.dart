import 'dart:io';

import 'package:cli_repl/cli_repl.dart';
import 'package:rgr/app/app_command_runner.dart';
import 'package:rgr/core/database/database.dart';
import 'package:rgr/core/database/postgres.dart';
import 'package:rgr/core/environment/environment.dart';

class App {
  static AppCommandRunner runner = AppCommandRunner();

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

    final repl = Repl(prompt: '> ');

    await for (final line in repl.runAsync()) {
      final trimmed = line.trim();

      if (trimmed.isEmpty) {
        continue;
      }

      await runCommand(trimmed);
    }
  }

  static Future<void> runCommand(String command) async {
    try {
      await runner.run(command);
    } catch (e) {
      stdout.writeln('An unexpected error occurred: $e');
    }
  }
}
