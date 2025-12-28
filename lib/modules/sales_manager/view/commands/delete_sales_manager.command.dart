import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/sales_manager/controller/delete_sales_manager.controller.dart';

class DeleteSalesManagerCommand
    extends LeafCommand<DeleteSalesManagerControllerArgs> {
  @override
  String get name => 'delete';

  @override
  String get description => 'Delete a sales manager';

  @override
  Controller<DeleteSalesManagerControllerArgs> get controller {
    return DeleteSalesManagerController();
  }

  DeleteSalesManagerCommand() {
    addArgument(
      Argument.integer(
        name: 'id',
        isRequired: true,
        help: 'The ID of the sales manager to delete',
      ),
    );
  }

  @override
  DeleteSalesManagerControllerArgs mapArguments(Map<String, dynamic> args) {
    return DeleteSalesManagerControllerArgs(id: args['id'] as int);
  }
}
