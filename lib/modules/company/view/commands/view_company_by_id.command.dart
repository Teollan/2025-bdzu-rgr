import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/argument/argument_schema.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/controller/view_company_by_id.controller.dart';

class ViewCompanyByIdCommand extends LeafCommand<Args> {
  ViewCompanyByIdCommand()
    : super(
        name: 'view-by-id',
        description: 'View company by ID',
        controller: ViewCompanyByIdController(),
        argumentSchema: ArgumentSchema({
          'id': Argument.integer(
            isRequired: true,
            help: 'The ID of the company to view',
          ),
        }, (parsed) => Args(id: parsed['id'] as int)),
      );
}
