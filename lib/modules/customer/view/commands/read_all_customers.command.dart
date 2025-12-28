import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/customer/controller/read_all_customers.controller.dart';

class ReadAllCustomersCommand
    extends LeafCommand<ReadAllCustomersControllerArgs> {
  @override
  String get name => 'read-all';

  @override
  String get description => 'Read all customers';

  @override
  Controller<ReadAllCustomersControllerArgs> get controller {
    return ReadAllCustomersController();
  }

  ReadAllCustomersCommand() {
    addArgument(
      Argument.integer(
        name: 'limit',
        help: 'Maximum number of customers to return',
        defaultValue: 10,
      ),
    );

    addArgument(
      Argument.integer(
        name: 'offset',
        help: 'Number of customers to skip',
        defaultValue: 0,
      ),
    );
  }

  @override
  ReadAllCustomersControllerArgs mapArguments(Map<String, dynamic> args) {
    return ReadAllCustomersControllerArgs(
      limit: args['limit'] as int,
      offset: args['offset'] as int,
    );
  }
}
