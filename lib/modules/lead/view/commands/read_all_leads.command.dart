import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/lead/controller/read_all_leads.controller.dart';

class ReadAllLeadsCommand extends LeafCommand<ReadAllLeadsControllerArgs> {
  @override
  String get name => 'read-all';

  @override
  String get description => 'Read all leads';

  @override
  Controller<ReadAllLeadsControllerArgs> get controller {
    return ReadAllLeadsController();
  }

  ReadAllLeadsCommand() {
    addArgument(
      Argument.integer(
        name: 'limit',
        help: 'Maximum number of leads to return',
        defaultValue: 10,
      ),
    );

    addArgument(
      Argument.integer(
        name: 'offset',
        help: 'Number of leads to skip',
        defaultValue: 0,
      ),
    );
  }

  @override
  ReadAllLeadsControllerArgs mapArguments(Map<String, dynamic> args) {
    return ReadAllLeadsControllerArgs(
      limit: args['limit'] as int,
      offset: args['offset'] as int,
    );
  }
}
