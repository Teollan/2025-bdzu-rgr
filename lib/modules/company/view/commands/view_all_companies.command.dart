import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/controller/view_all_companies.controller.dart';

class ViewAllCompaniesCommand
    extends LeafCommand<ViewAllCompaniesControllerArgs> {
  @override
  String get name => 'view-all';

  @override
  String get description => 'View all companies';

  @override
  Controller<ViewAllCompaniesControllerArgs> get controller {
    return ViewAllCompaniesController();
  }

  ViewAllCompaniesCommand() {
    addArgument(
      Argument.integer(
        name: 'limit',
        help: 'Maximum number of companies to return',
        defaultValue: 10,
      ),
    );

    addArgument(
      Argument.integer(
        name: 'offset',
        help: 'Number of companies to skip',
        defaultValue: 0,
      ),
    );
  }

  @override
  ViewAllCompaniesControllerArgs mapArguments(Map<String, dynamic> args) {
    return ViewAllCompaniesControllerArgs(
      limit: args['limit'] as int,
      offset: args['offset'] as int,
    );
  }
}
