import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/controller/read_all_companies.controller.dart';

class ReadAllCompaniesCommand
    extends LeafCommand<ReadAllCompaniesControllerArgs> {
  @override
  String get name => 'read-all';

  @override
  String get description => 'Read all companies';

  @override
  Controller<ReadAllCompaniesControllerArgs> get controller {
    return ReadAllCompaniesController();
  }

  ReadAllCompaniesCommand() {
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
  ReadAllCompaniesControllerArgs mapArguments(Map<String, dynamic> args) {
    return ReadAllCompaniesControllerArgs(
      limit: args['limit'] as int,
      offset: args['offset'] as int,
    );
  }
}
