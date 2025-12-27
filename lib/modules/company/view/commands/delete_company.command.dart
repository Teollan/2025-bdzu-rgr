import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/argument/argument_schema.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/controller/delete_company.controller.dart';

LeafCommand<Args> buildDeleteCompanyCommand() {
  return LeafCommand(
    name: 'delete',
    description: 'Delete a company',
    controller: DeleteCompanyController(),
    argumentSchema: ArgumentSchema({
      'id': Argument.integer(
        isRequired: true,
        help: 'The ID of the company to delete',
      ),
    }, (parsed) => Args(id: parsed['id'] as int)),
  );
}
