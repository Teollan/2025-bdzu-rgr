import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/controller/view_company.controller.dart';

class ViewCompanyCommand extends LeafCommand<ViewCompanyControllerArgs> {
  @override
  String get name => 'view';

  @override
  String get description => 'View company by ID';

  @override
  Controller<ViewCompanyControllerArgs> get controller {
    return ViewCompanyController();
  }

  ViewCompanyCommand() {
    addArgument(
      Argument.integer(
        name: 'id',
        isRequired: true,
        help: 'The ID of the company to view',
      ),
    );
  }

  @override
  ViewCompanyControllerArgs mapArguments(Map<String, dynamic> args) {
    return ViewCompanyControllerArgs(id: args['id'] as int);
  }
}
