import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/lead/model/lead.repository.dart';
import 'package:rgr/modules/lead/view/lead.view.dart';

class ReadOneLeadControllerArgs {
  final int id;

  ReadOneLeadControllerArgs({required this.id});
}

class ReadOneLeadController extends Controller<ReadOneLeadControllerArgs> {
  final repository = LeadRepository();

  @override
  Future<void> run(args) async {
    final lead = await repository.findLeadById(args.id);

    if (lead == null) {
      print('Lead with id ${args.id} not found.');
      return;
    }

    LeadView.showLead(lead);
  }
}
