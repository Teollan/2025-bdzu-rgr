import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/customer/model/customer.repository.dart';

class CreateCustomerControllerArgs {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;

  CreateCustomerControllerArgs({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });
}

class CreateCustomerController
    extends Controller<CreateCustomerControllerArgs> {
  @override
  Future<void> run(CreateCustomerControllerArgs args) async {
    final repository = CustomerRepository();
    final customer = await repository.createCustomer(
      firstName: args.firstName,
      lastName: args.lastName,
      phoneNumber: args.phoneNumber,
      email: args.email,
    );

    print('Customer created with id ${customer.id}');
  }
}
