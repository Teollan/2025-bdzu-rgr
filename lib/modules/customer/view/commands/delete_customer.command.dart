import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/customer/controller/delete_customer.controller.dart';

class DeleteCustomerCommand
    extends LeafCommand<DeleteCustomerControllerArgs> {
  @override
  String get name => 'delete';

  @override
  String get description => 'Delete a customer';

  @override
  Controller<DeleteCustomerControllerArgs> get controller {
    return DeleteCustomerController();
  }

  DeleteCustomerCommand() {
    addArgument(
      Argument.integer(
        name: 'id',
        isRequired: true,
        help: 'The ID of the customer to delete',
      ),
    );
  }

  @override
  DeleteCustomerControllerArgs mapArguments(Map<String, dynamic> args) {
    return DeleteCustomerControllerArgs(id: args['id'] as int);
  }
}
