import 'dart:io';
import 'package:rgr/core/database/postgres.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/company/controller/viewAllCompanies.controller.dart';
import 'package:rgr/modules/company/controller/viewCompanyById.controller.dart';

void app() async {
  await Postgres.establishConnection();

  final commands = Fork({
    'company': Fork({
      'view': Fork({
        'all': Action(ViewAllCompaniesController()),
        'one': Action(ViewCompanyByIdController()),
      }),
    }),
  });

  print("The program is running...");

  while (true) {
    final input = stdin.readLineSync();

    await commands.execute(input!);
  }
}
