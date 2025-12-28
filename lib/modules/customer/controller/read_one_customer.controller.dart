import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/customer/model/customer.repository.dart';
import 'package:rgr/modules/customer/view/customer.view.dart';

class ReadOneCustomerControllerArgs {
  final int id;

  ReadOneCustomerControllerArgs({required this.id});
}

class ReadOneCustomerController
    extends Controller<ReadOneCustomerControllerArgs> {
  final repository = CustomerRepository();

  @override
  Future<void> run(args) async {
    final customer = await repository.findCustomerById(args.id);

    if (customer == null) {
      print('Customer with id ${args.id} not found.');
      return;
    }

    CustomerView.showCustomer(customer);
  }
}
