class DatabaseConnectionParameters {
  final String host;
  final int port;
  final String database;
  final String username;
  final String password;

  DatabaseConnectionParameters({
    required this.host,
    required this.port,
    required this.database,
    required this.username,
    required this.password,
  });
}

abstract class Database {
  void connect(DatabaseConnectionParameters parameters);

  Future<List<Map<String, dynamic>>> query(
    String sql, {
    Map<String, dynamic> parameters,
  });
}
