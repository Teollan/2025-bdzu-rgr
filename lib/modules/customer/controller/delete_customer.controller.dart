import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/customer/model/customer.repository.dart';

class DeleteCustomerControllerArgs {
  final int id;

  DeleteCustomerControllerArgs({required this.id});
}

class DeleteCustomerController
    extends Controller<DeleteCustomerControllerArgs> {
  @override
  Future<void> run(DeleteCustomerControllerArgs args) async {
    final repository = CustomerRepository();
    final customer = await repository.deleteCustomer(args.id);

    print('Customer ${customer.id} deleted successfully');
  }
}
