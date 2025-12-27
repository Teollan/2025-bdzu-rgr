import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/argument/argument_schema.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/controller/update_company.controller.dart';

LeafCommand<Args> buildUpdateCompanyCommand() {
  return LeafCommand(
    name: 'update',
    description: 'Update an existing company',
    controller: UpdateCompanyController(),
    argumentSchema: ArgumentSchema({
      'id': Argument.integer(
        isRequired: true,
        help: 'The ID of the company to update',
      ),
      'name': Argument.string(
        isRequired: true,
        help: 'The new name for the company',
      ),
    }, (parsed) => Args(
      id: parsed['id'] as int,
      name: parsed['name'] as String,
    )),
  );
}
