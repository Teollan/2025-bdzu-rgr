import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/view/commands/view_all_companies.command.dart';
import 'package:rgr/modules/company/view/commands/view_company_by_id.command.dart';

BranchCommand buildCompanyCommands() {
  final companyCommands = BranchCommand(
    name: 'company',
    description: 'Commands related to company entity',
  );

  companyCommands
    ..addSubcommand(ViewAllCompaniesCommand())
    ..addSubcommand(ViewCompanyByIdCommand());

  return companyCommands;
}
