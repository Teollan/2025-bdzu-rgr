import 'package:rgr/core/database/database.dart';
import 'package:rgr/core/database/postgres.dart';

class Repository {
  final Database db = PostgresDatabase();
}
