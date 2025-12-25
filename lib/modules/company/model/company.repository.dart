import 'package:rgr/core/repository/repository.dart';
import 'package:rgr/modules/company/model/company.model.dart';

class CompanyRepository extends Repository {
  Company toModel(Map<String, dynamic> row) {
    return Company(id: row['id'] as int, name: row['name'] as String);
  }

  Future<Company?> findCompany(int id) async {
    final result = await db.query(
      '''
      SELECT *
      FROM companies
      WHERE id = @id;
      ''',
      parameters: {'id': id},
    );

    if (result.isEmpty) {
      return null;
    }

    return toModel(result.first);
  }

  Future<List<Company>> findAllCompanies() async {
    final result = await db.query('SELECT * FROM companies;');

    return result.map(toModel).toList();
  }

  Future<Company> createCompany({required String name}) async {
    final result = await db.query(
      '''
      INSERT INTO companies (name)
      VALUES (@name)
      RETURNING *;
      ''',
      parameters: {'name': name},
    );

    return toModel(result.first);
  }

  Future<Company> updateCompany(int id, {String? name}) async {
    final result = await db.query(
      '''
      UPDATE companies
      SET name = @name
      WHERE id = @id
      RETURNING *;
      ''',
      parameters: {'id': id, 'name': name},
    );

    return toModel(result.first);
  }

  Future<Company> deleteCompany(int id) async {
    final result = await db.query(
      '''
      DELETE FROM companies
      WHERE id = @id
      RETURNING *;
      ''',
      parameters: {'id': id},
    );

    return toModel(result.first);
  }
}
