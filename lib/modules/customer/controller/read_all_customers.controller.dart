import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/customer/model/customer.repository.dart';
import 'package:rgr/modules/customer/view/customer.view.dart';

class ReadAllCustomersControllerArgs {
  final int limit;
  final int offset;

  ReadAllCustomersControllerArgs({
    required this.limit,
    required this.offset,
  });
}

class ReadAllCustomersController
    extends Controller<ReadAllCustomersControllerArgs> {
  final repository = CustomerRepository();

  @override
  Future<void> run(args) async {
    final customers = await repository.getAllCustomers(
      limit: args.limit,
      offset: args.offset,
    );

    if (customers.isEmpty) {
      print('No customers found.');
      return;
    }

    print('Customers found:');
    CustomerView.showCustomers(customers);
  }
}
