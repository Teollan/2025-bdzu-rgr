import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/lead/model/lead.repository.dart';

class CreateLeadControllerArgs {
  final int companyId;
  final int customerId;
  final String status;

  CreateLeadControllerArgs({
    required this.companyId,
    required this.customerId,
    required this.status,
  });
}

class CreateLeadController extends Controller<CreateLeadControllerArgs> {
  @override
  Future<void> run(CreateLeadControllerArgs args) async {
    final repository = LeadRepository();
    final lead = await repository.createLead(
      companyId: args.companyId,
      customerId: args.customerId,
      status: args.status,
    );

    print('Lead created with id ${lead.id}');
  }
}
