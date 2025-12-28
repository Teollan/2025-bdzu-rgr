import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/customer/model/customer.repository.dart';

class UpdateCustomerControllerArgs {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? email;

  UpdateCustomerControllerArgs({
    required this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
  });
}

class UpdateCustomerController
    extends Controller<UpdateCustomerControllerArgs> {
  @override
  Future<void> run(UpdateCustomerControllerArgs args) async {
    final repository = CustomerRepository();
    final customer = await repository.updateCustomer(
      args.id,
      firstName: args.firstName,
      lastName: args.lastName,
      phoneNumber: args.phoneNumber,
      email: args.email,
    );

    print('Customer ${customer.id} updated successfully');
  }
}
