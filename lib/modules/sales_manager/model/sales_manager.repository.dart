import 'package:rgr/core/repository/repository.dart';
import 'package:rgr/modules/sales_manager/model/sales_manager.entity.dart';

class SalesManagerRepository extends Repository {
  SalesManager toEntity(Map<String, dynamic> row) {
    return SalesManager(
      id: row['id'] as int,
      companyId: row['company_id'] as int,
      firstName: row['first_name'] as String,
      lastName: row['last_name'] as String,
    );
  }

  Future<SalesManager?> findSalesManagerById(int id) async {
    final result = await db.query(
      '''
      SELECT *
      FROM sales_managers
      WHERE id = @id;
      ''',
      parameters: {'id': id},
    );

    if (result.isEmpty) {
      return null;
    }

    return toEntity(result.first);
  }

  Future<List<SalesManager>> getAllSalesManagers({
    int limit = 20,
    int offset = 0,
  }) async {
    final result = await db.query(
      '''
      SELECT *
      FROM sales_managers
      LIMIT @limit
      OFFSET @offset;
      ''',
      parameters: {'limit': limit, 'offset': offset},
    );

    return result.map(toEntity).toList();
  }

  Future<SalesManager> createSalesManager({
    required int companyId,
    required String firstName,
    required String lastName,
  }) async {
    final result = await db.query(
      '''
      INSERT INTO sales_managers (company_id, first_name, last_name)
      VALUES (@companyId, @firstName, @lastName)
      RETURNING *;
      ''',
      parameters: {
        'companyId': companyId,
        'firstName': firstName,
        'lastName': lastName,
      },
    );

    return toEntity(result.first);
  }

  Future<SalesManager> updateSalesManager(
    int id, {
    int? companyId,
    String? firstName,
    String? lastName,
  }) async {
    final result = await db.query(
      '''
      UPDATE sales_managers
      SET company_id = COALESCE(@companyId, company_id),
          first_name = COALESCE(@firstName, first_name),
          last_name = COALESCE(@lastName, last_name)
      WHERE id = @id
      RETURNING *;
      ''',
      parameters: {
        'id': id,
        'companyId': companyId,
        'firstName': firstName,
        'lastName': lastName,
      },
    );

    return toEntity(result.first);
  }

  Future<SalesManager> deleteSalesManager(int id) async {
    final result = await db.query(
      '''
      DELETE FROM sales_managers
      WHERE id = @id
      RETURNING *;
      ''',
      parameters: {'id': id},
    );

    return toEntity(result.first);
  }
}
