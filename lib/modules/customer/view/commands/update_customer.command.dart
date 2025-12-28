import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/customer/controller/update_customer.controller.dart';

class UpdateCustomerCommand
    extends LeafCommand<UpdateCustomerControllerArgs> {
  @override
  String get name => 'update';

  @override
  String get description => 'Update an existing customer';

  @override
  Controller<UpdateCustomerControllerArgs> get controller {
    return UpdateCustomerController();
  }

  UpdateCustomerCommand() {
    addArgument(
      Argument.integer(
        name: 'id',
        isRequired: true,
        help: 'The ID of the customer to update',
      ),
    );

    addArgument(
      Argument.string(
        name: 'first-name',
        help: 'The new first name',
      ),
    );

    addArgument(
      Argument.string(
        name: 'last-name',
        help: 'The new last name',
      ),
    );

    addArgument(
      Argument.string(
        name: 'phone-number',
        help: 'The new phone number',
      ),
    );

    addArgument(
      Argument.string(
        name: 'email',
        help: 'The new email',
      ),
    );
  }

  @override
  UpdateCustomerControllerArgs mapArguments(Map<String, dynamic> args) {
    return UpdateCustomerControllerArgs(
      id: args['id'] as int,
      firstName: args['first-name'] as String?,
      lastName: args['last-name'] as String?,
      phoneNumber: args['phone-number'] as String?,
      email: args['email'] as String?,
    );
  }
}
