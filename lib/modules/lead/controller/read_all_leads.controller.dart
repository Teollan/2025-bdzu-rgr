import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/lead/model/lead.repository.dart';
import 'package:rgr/modules/lead/view/lead.view.dart';

class ReadAllLeadsControllerArgs {
  final int limit;
  final int offset;

  ReadAllLeadsControllerArgs({
    required this.limit,
    required this.offset,
  });
}

class ReadAllLeadsController extends Controller<ReadAllLeadsControllerArgs> {
  final repository = LeadRepository();

  @override
  Future<void> run(args) async {
    final leads = await repository.getAllLeads(
      limit: args.limit,
      offset: args.offset,
    );

    if (leads.isEmpty) {
      print('No leads found.');
      return;
    }

    print('Leads found:');
    LeadView.showLeads(leads);
  }
}
