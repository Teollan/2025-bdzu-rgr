import 'package:rgr/core/input/argument/argument_schema.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/controller/view_all_companies.controller.dart';

class ViewAllCompaniesCommand extends LeafCommand<void> {
  ViewAllCompaniesCommand()
    : super(
        name: 'view-all',
        description: 'View all companies',
        controller: ViewAllCompaniesController(),
        argumentSchema: ArgumentSchema({}, (_) => {}),
      );
}
