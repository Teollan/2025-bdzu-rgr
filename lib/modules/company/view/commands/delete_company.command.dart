import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/controller/delete_company.controller.dart';

class DeleteCompanyCommand extends LeafCommand<DeleteCompanyControllerArgs> {
  @override
  String get name => 'delete';

  @override
  String get description => 'Delete a company';

  @override
  Controller<DeleteCompanyControllerArgs> get controller {
    return DeleteCompanyController();
  }

  DeleteCompanyCommand() {
    addArgument(
      Argument.integer(
        name: 'id',
        isRequired: true,
        help: 'The ID of the company to delete',
      ),
    );
  }

  @override
  DeleteCompanyControllerArgs mapArguments(Map<String, dynamic> args) {
    return DeleteCompanyControllerArgs(id: args['id'] as int);
  }
}
