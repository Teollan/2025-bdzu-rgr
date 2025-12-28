import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/lead/controller/create_lead.controller.dart';

class CreateLeadCommand extends LeafCommand<CreateLeadControllerArgs> {
  @override
  String get name => 'create';

  @override
  String get description => 'Create a new lead';

  @override
  Controller<CreateLeadControllerArgs> get controller {
    return CreateLeadController();
  }

  CreateLeadCommand() {
    addArgument(
      Argument.integer(
        name: 'company-id',
        isRequired: true,
        help: 'The company ID for the lead',
      ),
    );

    addArgument(
      Argument.integer(
        name: 'customer-id',
        isRequired: true,
        help: 'The customer ID for the lead',
      ),
    );

    addArgument(
      Argument.string(
        name: 'status',
        isRequired: true,
        help: 'The status of the lead',
      ),
    );
  }

  @override
  CreateLeadControllerArgs mapArguments(Map<String, dynamic> args) {
    return CreateLeadControllerArgs(
      companyId: args['company-id'] as int,
      customerId: args['customer-id'] as int,
      status: args['status'] as String,
    );
  }
}
