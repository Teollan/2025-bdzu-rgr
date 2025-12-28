import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/sales_manager/view/commands/create_sales_manager.command.dart';
import 'package:rgr/modules/sales_manager/view/commands/delete_sales_manager.command.dart';
import 'package:rgr/modules/sales_manager/view/commands/read_all_sales_managers.command.dart';
import 'package:rgr/modules/sales_manager/view/commands/read_one_sales_manager.command.dart';
import 'package:rgr/modules/sales_manager/view/commands/update_sales_manager.command.dart';

class SalesManagersCommand extends BranchCommand {
  @override
  String get name => 'sales-managers';

  @override
  String get description => 'Commands related to "sales_managers" table.';

  SalesManagersCommand() {
    addSubcommand(ReadAllSalesManagersCommand());
    addSubcommand(ReadOneSalesManagerCommand());
    addSubcommand(CreateSalesManagerCommand());
    addSubcommand(UpdateSalesManagerCommand());
    addSubcommand(DeleteSalesManagerCommand());
  }
}
