import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/controller/update_company.controller.dart';

class UpdateCompanyCommand extends LeafCommand<UpdateCompanyControllerArgs> {
  @override
  String get name => 'update';

  @override
  String get description => 'Update an existing company';

  @override
  Controller<UpdateCompanyControllerArgs> get controller {
    return UpdateCompanyController();
  }

  UpdateCompanyCommand() {
    addArgument(
      Argument.integer(
        name: 'id',
        isRequired: true,
        help: 'The ID of the company to update',
      ),
    );

    addArgument(
      Argument.string(
        name: 'name',
        isRequired: true,
        help: 'The new name for the company',
      ),
    );
  }

  @override
  UpdateCompanyControllerArgs mapArguments(Map<String, dynamic> args) {
    return UpdateCompanyControllerArgs(
      id: args['id'] as int,
      name: args['name'] as String,
    );
  }
}
