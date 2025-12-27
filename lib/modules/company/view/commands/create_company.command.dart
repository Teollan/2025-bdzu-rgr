import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/controller/create_company.controller.dart';

class CreateCompanyCommand extends LeafCommand<CreateCompanyControllerArgs> {
  @override
  String get name => 'create';

  @override
  String get description => 'Create a new company';

  @override
  Controller<CreateCompanyControllerArgs> get controller {
    return CreateCompanyController();
  }

  CreateCompanyCommand() {
    addArgument(
      Argument.string(
        name: 'name',
        isRequired: true,
        help: 'The name of the company to create',
      ),
    );
  }

  @override
  CreateCompanyControllerArgs mapArguments(Map<String, dynamic> args) {
    return CreateCompanyControllerArgs(name: args['name'] as String);
  }
}
