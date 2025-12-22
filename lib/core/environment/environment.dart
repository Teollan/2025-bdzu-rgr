import 'package:dotenv/dotenv.dart';

abstract class Environment {
  static final _env = DotEnv()..load();

  static final dbHost = Environment._env['DB_HOST'] ?? 'localhost';
  static final dbPort = int.parse(Environment._env['DB_PORT'] ?? '5432');
  static final dbUser = Environment._env['DB_USER'] ?? 'postgres';
  static final dbPassword = Environment._env['DB_PASSWORD'] ?? 'postgres';
  static final dbName = Environment._env['DB_NAME'] ?? 'postgres';
}
