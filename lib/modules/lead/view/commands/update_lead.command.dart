import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/lead/controller/update_lead.controller.dart';

class UpdateLeadCommand extends LeafCommand<UpdateLeadControllerArgs> {
  @override
  String get name => 'update';

  @override
  String get description => 'Update an existing lead';

  @override
  Controller<UpdateLeadControllerArgs> get controller {
    return UpdateLeadController();
  }

  UpdateLeadCommand() {
    addArgument(
      Argument.integer(
        name: 'id',
        isRequired: true,
        help: 'The ID of the lead to update',
      ),
    );

    addArgument(
      Argument.integer(
        name: 'company-id',
        help: 'The new company ID',
      ),
    );

    addArgument(
      Argument.integer(
        name: 'customer-id',
        help: 'The new customer ID',
      ),
    );

    addArgument(
      Argument.string(
        name: 'status',
        help: 'The new status',
      ),
    );
  }

  @override
  UpdateLeadControllerArgs mapArguments(Map<String, dynamic> args) {
    return UpdateLeadControllerArgs(
      id: args['id'] as int,
      companyId: args['company-id'] as int?,
      customerId: args['customer-id'] as int?,
      status: args['status'] as String?,
    );
  }
}
