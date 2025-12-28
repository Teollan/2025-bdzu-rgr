import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/customer/view/commands/create_customer.command.dart';
import 'package:rgr/modules/customer/view/commands/delete_customer.command.dart';
import 'package:rgr/modules/customer/view/commands/read_all_customers.command.dart';
import 'package:rgr/modules/customer/view/commands/read_one_customer.command.dart';
import 'package:rgr/modules/customer/view/commands/update_customer.command.dart';

class CustomersCommand extends BranchCommand {
  @override
  String get name => 'customers';

  @override
  String get description => 'Commands related to "customers" table.';

  CustomersCommand() {
    addSubcommand(ReadAllCustomersCommand());
    addSubcommand(ReadOneCustomerCommand());
    addSubcommand(CreateCustomerCommand());
    addSubcommand(UpdateCustomerCommand());
    addSubcommand(DeleteCustomerCommand());
  }
}
