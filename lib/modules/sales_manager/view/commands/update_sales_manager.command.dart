import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/sales_manager/controller/update_sales_manager.controller.dart';

class UpdateSalesManagerCommand
    extends LeafCommand<UpdateSalesManagerControllerArgs> {
  @override
  String get name => 'update';

  @override
  String get description => 'Update an existing sales manager';

  @override
  Controller<UpdateSalesManagerControllerArgs> get controller {
    return UpdateSalesManagerController();
  }

  UpdateSalesManagerCommand() {
    addArgument(
      Argument.integer(
        name: 'id',
        isRequired: true,
        help: 'The ID of the sales manager to update',
      ),
    );

    addArgument(
      Argument.integer(
        name: 'company-id',
        help: 'The new company ID',
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
  }

  @override
  UpdateSalesManagerControllerArgs mapArguments(Map<String, dynamic> args) {
    return UpdateSalesManagerControllerArgs(
      id: args['id'] as int,
      companyId: args['company-id'] as int?,
      firstName: args['first-name'] as String?,
      lastName: args['last-name'] as String?,
    );
  }
}
