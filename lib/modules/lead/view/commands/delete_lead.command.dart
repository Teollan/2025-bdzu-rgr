import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/lead/controller/delete_lead.controller.dart';

class DeleteLeadCommand extends LeafCommand<DeleteLeadControllerArgs> {
  @override
  String get name => 'delete';

  @override
  String get description => 'Delete a lead';

  @override
  Controller<DeleteLeadControllerArgs> get controller {
    return DeleteLeadController();
  }

  DeleteLeadCommand() {
    addArgument(
      Argument.integer(
        name: 'id',
        isRequired: true,
        help: 'The ID of the lead to delete',
      ),
    );
  }

  @override
  DeleteLeadControllerArgs mapArguments(Map<String, dynamic> args) {
    return DeleteLeadControllerArgs(id: args['id'] as int);
  }
}
