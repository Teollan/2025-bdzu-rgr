import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/sales_manager/controller/read_all_sales_managers.controller.dart';

class ReadAllSalesManagersCommand
    extends LeafCommand<ReadAllSalesManagersControllerArgs> {
  @override
  String get name => 'read-all';

  @override
  String get description => 'Read all sales managers';

  @override
  Controller<ReadAllSalesManagersControllerArgs> get controller {
    return ReadAllSalesManagersController();
  }

  ReadAllSalesManagersCommand() {
    addArgument(
      Argument.integer(
        name: 'limit',
        help: 'Maximum number of sales managers to return',
        defaultValue: 10,
      ),
    );

    addArgument(
      Argument.integer(
        name: 'offset',
        help: 'Number of sales managers to skip',
        defaultValue: 0,
      ),
    );
  }

  @override
  ReadAllSalesManagersControllerArgs mapArguments(Map<String, dynamic> args) {
    return ReadAllSalesManagersControllerArgs(
      limit: args['limit'] as int,
      offset: args['offset'] as int,
    );
  }
}
