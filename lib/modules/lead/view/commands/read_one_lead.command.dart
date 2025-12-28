import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/core/input/command/command.dart';
import 'package:rgr/modules/lead/controller/read_one_lead.controller.dart';

class ReadOneLeadCommand extends LeafCommand<ReadOneLeadControllerArgs> {
  @override
  String get name => 'read-one';

  @override
  String get description => 'Read lead by ID';

  @override
  Controller<ReadOneLeadControllerArgs> get controller {
    return ReadOneLeadController();
  }

  ReadOneLeadCommand() {
    addArgument(
      Argument.integer(
        name: 'id',
        isRequired: true,
        help: 'The ID of the lead to read',
      ),
    );
  }

  @override
  ReadOneLeadControllerArgs mapArguments(Map<String, dynamic> args) {
    return ReadOneLeadControllerArgs(id: args['id'] as int);
  }
}
