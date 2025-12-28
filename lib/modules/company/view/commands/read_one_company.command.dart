import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/controller/read_one_company.controller.dart';

class ReadOneCompanyCommand extends LeafCommand<ReadOneCompanyControllerArgs> {
  @override
  String get name => 'read-one';

  @override
  String get description => 'Read company by ID';

  @override
  Controller<ReadOneCompanyControllerArgs> get controller {
    return ReadOneCompanyController();
  }

  ReadOneCompanyCommand() {
    addArgument(
      Argument.integer(
        name: 'id',
        isRequired: true,
        help: 'The ID of the company to read',
      ),
    );
  }

  @override
  ReadOneCompanyControllerArgs mapArguments(Map<String, dynamic> args) {
    return ReadOneCompanyControllerArgs(id: args['id'] as int);
  }
}
