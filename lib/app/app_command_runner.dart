import 'package:args/command_runner.dart';
import 'package:rgr/modules/app/view/commands/quit.command.dart';
import 'package:rgr/modules/company/view/commands/companies.command.dart';
import 'package:rgr/modules/customer/view/commands/customers.command.dart';
import 'package:rgr/modules/lead/view/commands/leads.command.dart';
import 'package:rgr/modules/sales_manager/view/commands/sales_managers.command.dart';

class AppCommandRunner {
  late final CommandRunner<void> runner;

  AppCommandRunner() {
    runner = CommandRunner<void>('', 'A command-line CRM application.');

    runner.addCommand(CompaniesCommand());
    runner.addCommand(SalesManagersCommand());
    runner.addCommand(CustomersCommand());
    runner.addCommand(LeadsCommand());
    runner.addCommand(QuitCommand());
  }

  Future<void> run(String command) async {
    await runner.run(splitArguments(command));
  }

  List<String> splitArguments(String input) {
    final args = <String>[];
    final buffer = StringBuffer();
    String? quote;

    for (final char in input.split('')) {
      if (quote != null) {
        if (char == quote) {
          quote = null;
        } else {
          buffer.write(char);
        }
      } else if (char == '"' || char == "'") {
        quote = char;
      } else if (char == ' ') {
        if (buffer.isNotEmpty) {
          args.add(buffer.toString());
          buffer.clear();
        }
      } else {
        buffer.write(char);
      }
    }

    if (buffer.isNotEmpty) {
      args.add(buffer.toString());
    }

    return args;
  }
}
