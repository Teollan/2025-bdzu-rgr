import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/argument/argument_schema.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/controller/view_company.controller.dart';

LeafCommand<Args> buildViewCompanyCommand() {
  return LeafCommand(
    name: 'view',
    description: 'View company by ID',
    controller: ViewCompanyController(),
    argumentSchema: ArgumentSchema({
      'id': Argument.integer(
        isRequired: true,
        help: 'The ID of the company to view',
      ),
    }, (parsed) => Args(id: parsed['id'] as int)),
  );
}
