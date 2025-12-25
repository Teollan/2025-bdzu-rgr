import 'package:rgr/core/database/database.dart';
import 'package:rgr/core/database/postgres.dart';
import 'package:rgr/core/environment/environment.dart';

class Repository {
  final Database db = PostgresDatabase();

  Repository() {
    db.connect(
      DatabaseConnectionParameters(
        host: Environment.dbHost,
        port: Environment.dbPort,
        database: Environment.dbName,
        username: Environment.dbUsername,
        password: Environment.dbPassword,
      ),
    );
  }
}
