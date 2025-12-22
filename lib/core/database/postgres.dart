import 'package:postgres/postgres.dart';
import 'package:rgr/core/environment/environment.dart';

class Postgres {
  static late final Connection instance;

  static Future<void> establishConnection() async {
    final openConnection = await Connection.open(
      Endpoint(
        host: Environment.dbHost,
        port: Environment.dbPort,
        database: Environment.dbName,
        username: Environment.dbUser,
        password: Environment.dbPassword,
      ),
      settings: ConnectionSettings(sslMode: SslMode.disable),
    );

    Postgres.instance = openConnection;
  }
}
