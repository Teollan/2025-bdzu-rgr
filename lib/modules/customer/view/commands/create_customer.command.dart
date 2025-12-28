import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/customer/controller/create_customer.controller.dart';

class CreateCustomerCommand
    extends LeafCommand<CreateCustomerControllerArgs> {
  @override
  String get name => 'create';

  @override
  String get description => 'Create a new customer';

  @override
  Controller<CreateCustomerControllerArgs> get controller {
    return CreateCustomerController();
  }

  CreateCustomerCommand() {
    addArgument(
      Argument.string(
        name: 'first-name',
        isRequired: true,
        help: 'The first name of the customer',
      ),
    );

    addArgument(
      Argument.string(
        name: 'last-name',
        isRequired: true,
        help: 'The last name of the customer',
      ),
    );

    addArgument(
      Argument.string(
        name: 'phone-number',
        isRequired: true,
        help: 'The phone number of the customer',
      ),
    );

    addArgument(
      Argument.string(
        name: 'email',
        isRequired: true,
        help: 'The email of the customer',
      ),
    );
  }

  @override
  CreateCustomerControllerArgs mapArguments(Map<String, dynamic> args) {
    return CreateCustomerControllerArgs(
      firstName: args['first-name'] as String,
      lastName: args['last-name'] as String,
      phoneNumber: args['phone-number'] as String,
      email: args['email'] as String,
    );
  }
}
