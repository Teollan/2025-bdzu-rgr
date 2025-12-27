import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/controller/find_companies_by_name.controller.dart';

class FindCompaniesByNameCommand
    extends LeafCommand<FindCompaniesByNameControllerArgs> {
  @override
  String get name => 'find-by-name';

  @override
  String get description => 'Find companies by name';

  @override
  Controller<FindCompaniesByNameControllerArgs> get controller {
    return FindCompaniesByNameController();
  }

  FindCompaniesByNameCommand() {
    addArgument(
      Argument.string(
        name: 'name',
        isRequired: true,
        help: 'The name (or part of name) to search for',
      ),
    );
  }

  @override
  FindCompaniesByNameControllerArgs mapArguments(Map<String, dynamic> args) {
    return FindCompaniesByNameControllerArgs(name: args['name'] as String);
  }
}
