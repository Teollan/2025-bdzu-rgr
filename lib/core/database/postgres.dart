import 'package:postgres/postgres.dart';
import 'package:rgr/core/database/database.dart';

class PostgresDatabase extends Database {
  static Connection? connection;

  @override
  Future<void> connect(parameters) async {
    if (PostgresDatabase.connection != null) {
      return;
    }

    final connection = await Connection.open(
      Endpoint(
        host: parameters.host,
        port: parameters.port,
        database: parameters.database,
        username: parameters.username,
        password: parameters.password,
      ),
      settings: ConnectionSettings(sslMode: SslMode.disable),
    );

    PostgresDatabase.connection = connection;
  }

  @override
  Future<List<Map<String, dynamic>>> query(
    String sql, {
    Map<String, dynamic>? parameters,
  }) async {
    if (connection == null) {
      throw Exception('Database not connected');
    }

    final result = await connection!.execute(sql, parameters: parameters);

    return result.map((row) => row.toColumnMap()).toList(growable: false);
  }
}
