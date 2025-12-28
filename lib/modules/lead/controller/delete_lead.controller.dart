import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/lead/model/lead.repository.dart';

class DeleteLeadControllerArgs {
  final int id;

  DeleteLeadControllerArgs({required this.id});
}

class DeleteLeadController extends Controller<DeleteLeadControllerArgs> {
  @override
  Future<void> run(DeleteLeadControllerArgs args) async {
    final repository = LeadRepository();
    final lead = await repository.deleteLead(args.id);

    print('Lead ${lead.id} deleted successfully');
  }
}
