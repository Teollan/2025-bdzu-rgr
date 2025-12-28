import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/sales_manager/controller/read_one_sales_manager.controller.dart';

class ReadOneSalesManagerCommand
    extends LeafCommand<ReadOneSalesManagerControllerArgs> {
  @override
  String get name => 'read-one';

  @override
  String get description => 'Read sales manager by ID';

  @override
  Controller<ReadOneSalesManagerControllerArgs> get controller {
    return ReadOneSalesManagerController();
  }

  ReadOneSalesManagerCommand() {
    addArgument(
      Argument.integer(
        name: 'id',
        isRequired: true,
        help: 'The ID of the sales manager to read',
      ),
    );
  }

  @override
  ReadOneSalesManagerControllerArgs mapArguments(Map<String, dynamic> args) {
    return ReadOneSalesManagerControllerArgs(id: args['id'] as int);
  }
}
