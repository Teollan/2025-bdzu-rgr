import 'package:rgr/core/database/postgres.dart';
import 'package:rgr/modules/company/model/company.model.dart';

class CompanyRepository {
  Company toModel(Map<String, dynamic> row) {
    return Company(id: row['id'] as int, name: row['name'] as String);
  }

  Future<Company?> findCompany(int id) async {
    final result = await Postgres.instance.execute(
      '''
      SELECT *
      FROM companies
      WHERE id = @id;
      ''',
      parameters: {id},
    );

    if (result.isEmpty) {
      return null;
    }

    return toModel(result.first.toColumnMap());
  }

  Future<List<Company>> findAllCompanies() async {
    final result = await Postgres.instance.execute('SELECT * FROM companies;');

    return result.map((row) => toModel(row.toColumnMap())).toList();
  }

  Future<Company> createCompany({required String name}) async {
    final result = await Postgres.instance.execute(
      '''
      INSERT INTO companies (name) VALUES
      (@name);
      ''',
      parameters: {name},
    );

    return toModel(result.first.toColumnMap());
  }

  Future<Company> updateCompany(int id, {String? name}) async {
    final result = await Postgres.instance.execute(
      '''
      UPDATE companies
      SET name = @name
      WHERE id = @id
      RETURNING *;
      ''',
      parameters: {name},
    );

    return toModel(result.first.toColumnMap());
  }

  Future<Company> deleteCompany(int id) async {
    final result = await Postgres.instance.execute(
      '''
      DELETE FROM companies
      WHERE id = @id;
      ''',
      parameters: {id},
    );

    return toModel(result.first.toColumnMap());
  }
}
