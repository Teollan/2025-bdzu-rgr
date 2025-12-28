import 'package:rgr/core/output/table.dart';
import 'package:rgr/modules/customer/model/customer.entity.dart';

export 'commands/customers.command.dart';

class CustomerView {
  static void showCustomer(Customer customer) {
    final Map<String, dynamic> map = {
      'id': customer.id,
      'first_name': customer.firstName,
      'last_name': customer.lastName,
      'phone_number': customer.phoneNumber,
      'email': customer.email,
    };

    final table = ColumnValueTable();

    print(table.build(map.entries));
  }

  static void showCustomers(List<Customer> customers) {
    final table = Table<Customer>(
      columns: {
        'id': (c) => c.id,
        'first_name': (c) => c.firstName,
        'last_name': (c) => c.lastName,
        'phone_number': (c) => c.phoneNumber,
        'email': (c) => c.email,
      },
    );

    print(table.build(customers));
  }
}
