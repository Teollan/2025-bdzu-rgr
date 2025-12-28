import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/lead/view/commands/create_lead.command.dart';
import 'package:rgr/modules/lead/view/commands/delete_lead.command.dart';
import 'package:rgr/modules/lead/view/commands/read_all_leads.command.dart';
import 'package:rgr/modules/lead/view/commands/read_one_lead.command.dart';
import 'package:rgr/modules/lead/view/commands/update_lead.command.dart';

class LeadsCommand extends BranchCommand {
  @override
  String get name => 'leads';

  @override
  String get description => 'Commands related to "leads" table.';

  LeadsCommand() {
    addSubcommand(ReadAllLeadsCommand());
    addSubcommand(ReadOneLeadCommand());
    addSubcommand(CreateLeadCommand());
    addSubcommand(UpdateLeadCommand());
    addSubcommand(DeleteLeadCommand());
  }
}
