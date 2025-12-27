import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/argument/argument_schema.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/controller/create_company.controller.dart';

LeafCommand<Args> buildCreateCompanyCommand() {
  return LeafCommand(
    name: 'create',
    description: 'Create a new company',
    controller: CreateCompanyController(),
    argumentSchema: ArgumentSchema({
      'name': Argument.string(
        isRequired: true,
        help: 'The name of the company to create',
      ),
    }, (parsed) => Args(name: parsed['name'] as String)),
  );
}
