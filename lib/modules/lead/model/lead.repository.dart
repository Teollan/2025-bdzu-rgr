import 'package:rgr/core/repository/repository.dart';
import 'package:rgr/modules/lead/model/lead.entity.dart';

class LeadRepository extends Repository {
  Lead toEntity(Map<String, dynamic> row) {
    return Lead(
      id: row['id'] as int,
      companyId: row['company_id'] as int,
      customerId: row['customer_id'] as int,
      status: row['status'] as String,
      createdAt: row['created_at'] as DateTime,
    );
  }

  Future<Lead?> findLeadById(int id) async {
    final result = await db.query(
      '''
      SELECT *
      FROM leads
      WHERE id = @id;
      ''',
      parameters: {'id': id},
    );

    if (result.isEmpty) {
      return null;
    }

    return toEntity(result.first);
  }

  Future<List<Lead>> getAllLeads({int? limit, int? offset}) async {
    final result = await db.query(
      '''
      SELECT *
      FROM leads
      LIMIT @limit
      OFFSET @offset;
      ''',
      parameters: {'limit': limit, 'offset': offset},
    );

    return result.map(toEntity).toList();
  }

  Future<Lead> createLead({
    required int companyId,
    required int customerId,
    required String status,
  }) async {
    final result = await db.query(
      '''
      INSERT INTO leads (company_id, customer_id, status, created_at)
      VALUES (@companyId, @customerId, @status, NOW())
      RETURNING *;
      ''',
      parameters: {
        'companyId': companyId,
        'customerId': customerId,
        'status': status,
      },
    );

    return toEntity(result.first);
  }

  Future<Lead> updateLead(
    int id, {
    int? companyId,
    int? customerId,
    String? status,
  }) async {
    final result = await db.query(
      '''
      UPDATE leads
      SET company_id = COALESCE(@companyId, company_id),
          customer_id = COALESCE(@customerId, customer_id),
          status = COALESCE(@status, status)
      WHERE id = @id
      RETURNING *;
      ''',
      parameters: {
        'id': id,
        'companyId': companyId,
        'customerId': customerId,
        'status': status,
      },
    );

    if (result.isEmpty) {
      throw Exception('Lead with id $id not found');
    }

    return toEntity(result.first);
  }

  Future<Lead> deleteLead(int id) async {
    final result = await db.query(
      '''
      DELETE FROM leads
      WHERE id = @id
      RETURNING *;
      ''',
      parameters: {'id': id},
    );

    if (result.isEmpty) {
      throw Exception('Lead with id $id not found');
    }

    return toEntity(result.first);
  }
}
