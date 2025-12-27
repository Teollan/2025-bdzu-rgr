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

typedef Rows = List<Map<String, dynamic>>;

abstract class Database {
  void connect(DatabaseConnectionParameters parameters);

  Future<Rows> query(String sql, {Map<String, dynamic> parameters});
}
