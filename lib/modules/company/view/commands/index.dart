import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/view/commands/create_company.command.dart';
import 'package:rgr/modules/company/view/commands/delete_company.command.dart';
import 'package:rgr/modules/company/view/commands/update_company.command.dart';
import 'package:rgr/modules/company/view/commands/view_all_companies.command.dart';
import 'package:rgr/modules/company/view/commands/view_company.command.dart';

final subcommands = [
  buildViewAllCompaniesCommand(),
  buildViewCompanyCommand(),
  buildCreateCompanyCommand(),
  buildUpdateCompanyCommand(),
  buildDeleteCompanyCommand(),
];

BranchCommand buildCompaniesCommands() {
  final companyCommands = BranchCommand(
    name: 'companies',
    description: 'Commands related to "companies" table.',
  );

  for (final command in subcommands) {
    companyCommands.addSubcommand(command);
  }

  return companyCommands;
}
