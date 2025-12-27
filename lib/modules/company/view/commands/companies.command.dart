import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/view/commands/create_company.command.dart';
import 'package:rgr/modules/company/view/commands/delete_company.command.dart';
import 'package:rgr/modules/company/view/commands/find_companies_by_name.command.dart';
import 'package:rgr/modules/company/view/commands/update_company.command.dart';
import 'package:rgr/modules/company/view/commands/view_all_companies.command.dart';
import 'package:rgr/modules/company/view/commands/view_company.command.dart';

class CompaniesCommand extends BranchCommand {
  @override
  String get name => 'companies';

  @override
  String get description => 'Commands related to "companies" table.';

  CompaniesCommand() {
    addSubcommand(ViewAllCompaniesCommand());
    addSubcommand(ViewCompanyCommand());
    addSubcommand(FindCompaniesByNameCommand());
    addSubcommand(CreateCompanyCommand());
    addSubcommand(UpdateCompanyCommand());
    addSubcommand(DeleteCompanyCommand());
  }
}
