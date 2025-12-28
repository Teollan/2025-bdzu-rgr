import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/customer/controller/read_one_customer.controller.dart';

class ReadOneCustomerCommand
    extends LeafCommand<ReadOneCustomerControllerArgs> {
  @override
  String get name => 'read-one';

  @override
  String get description => 'Read customer by ID';

  @override
  Controller<ReadOneCustomerControllerArgs> get controller {
    return ReadOneCustomerController();
  }

  ReadOneCustomerCommand() {
    addArgument(
      Argument.integer(
        name: 'id',
        isRequired: true,
        help: 'The ID of the customer to read',
      ),
    );
  }

  @override
  ReadOneCustomerControllerArgs mapArguments(Map<String, dynamic> args) {
    return ReadOneCustomerControllerArgs(id: args['id'] as int);
  }
}
