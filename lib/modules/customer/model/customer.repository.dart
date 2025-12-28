import 'package:rgr/core/repository/repository.dart';
import 'package:rgr/modules/customer/model/customer.entity.dart';

class CustomerRepository extends Repository {
  Customer toEntity(Map<String, dynamic> row) {
    return Customer(
      id: row['id'] as int,
      firstName: row['first_name'] as String,
      lastName: row['last_name'] as String,
      phoneNumber: row['phone_number'] as String,
      email: row['email'] as String,
    );
  }

  Future<Customer?> findCustomerById(int id) async {
    final result = await db.query(
      '''
      SELECT *
      FROM customers
      WHERE id = @id;
      ''',
      parameters: {'id': id},
    );

    if (result.isEmpty) {
      return null;
    }

    return toEntity(result.first);
  }

  Future<List<Customer>> getAllCustomers({int? limit, int? offset}) async {
    final result = await db.query(
      '''
      SELECT *
      FROM customers
      LIMIT @limit
      OFFSET @offset;
      ''',
      parameters: {'limit': limit, 'offset': offset},
    );

    return result.map(toEntity).toList();
  }

  Future<Customer> createCustomer({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
  }) async {
    final result = await db.query(
      '''
      INSERT INTO customers (first_name, last_name, phone_number, email)
      VALUES (@firstName, @lastName, @phoneNumber, @email)
      RETURNING *;
      ''',
      parameters: {
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
      },
    );

    return toEntity(result.first);
  }

  Future<Customer> updateCustomer(
    int id, {
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
  }) async {
    final result = await db.query(
      '''
      UPDATE customers
      SET first_name = COALESCE(@firstName, first_name),
          last_name = COALESCE(@lastName, last_name),
          phone_number = COALESCE(@phoneNumber, phone_number),
          email = COALESCE(@email, email)
      WHERE id = @id
      RETURNING *;
      ''',
      parameters: {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
      },
    );

    if (result.isEmpty) {
      throw Exception('Customer with id $id not found');
    }

    return toEntity(result.first);
  }

  Future<Customer> deleteCustomer(int id) async {
    final result = await db.query(
      '''
      DELETE FROM customers
      WHERE id = @id
      RETURNING *;
      ''',
      parameters: {'id': id},
    );

    if (result.isEmpty) {
      throw Exception('Customer with id $id not found');
    }

    return toEntity(result.first);
  }
}
