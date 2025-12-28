import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/sales_manager/controller/create_sales_manager.controller.dart';

class CreateSalesManagerCommand
    extends LeafCommand<CreateSalesManagerControllerArgs> {
  @override
  String get name => 'create';

  @override
  String get description => 'Create a new sales manager';

  @override
  Controller<CreateSalesManagerControllerArgs> get controller {
    return CreateSalesManagerController();
  }

  CreateSalesManagerCommand() {
    addArgument(
      Argument.integer(
        name: 'company-id',
        isRequired: true,
        help: 'The ID of the company',
      ),
    );

    addArgument(
      Argument.string(
        name: 'first-name',
        isRequired: true,
        help: 'The first name of the sales manager',
      ),
    );

    addArgument(
      Argument.string(
        name: 'last-name',
        isRequired: true,
        help: 'The last name of the sales manager',
      ),
    );
  }

  @override
  CreateSalesManagerControllerArgs mapArguments(Map<String, dynamic> args) {
    return CreateSalesManagerControllerArgs(
      companyId: args['company-id'] as int,
      firstName: args['first-name'] as String,
      lastName: args['last-name'] as String,
    );
  }
}
