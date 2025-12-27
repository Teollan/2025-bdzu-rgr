import 'package:rgr/core/repository/repository.dart';
import 'package:rgr/modules/company/model/company.entity.dart';

class CompanyRepository extends Repository {
  Company toEntity(Map<String, dynamic> row) {
    return Company(id: row['id'] as int, name: row['name'] as String);
  }

  Future<Company?> findCompanyById(int id) async {
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

    return toEntity(result.first);
  }

  Future<List<Company>> findCompaniesByName(String name) async {
    final result = await db.query(
      '''
      SELECT *
      FROM companies
      WHERE name ILIKE @name;
      ''',
      parameters: {'name': '%$name%'},
    );

    return result.map(toEntity).toList();
  }

  Future<List<Company>> getAllCompanies({int? limit, int? offset}) async {
    final result = await db.query(
      '''
      SELECT * FROM companies
      LIMIT @limit
      OFFSET @offset;
      ''',
      parameters: {'limit': limit, 'offset': offset},
    );

    return result.map(toEntity).toList();
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

    return toEntity(result.first);
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

    return toEntity(result.first);
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

    return toEntity(result.first);
  }
}
