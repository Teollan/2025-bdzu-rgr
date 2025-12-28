import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/lead/model/lead.repository.dart';

class UpdateLeadControllerArgs {
  final int id;
  final int? companyId;
  final int? customerId;
  final String? status;

  UpdateLeadControllerArgs({
    required this.id,
    this.companyId,
    this.customerId,
    this.status,
  });
}

class UpdateLeadController extends Controller<UpdateLeadControllerArgs> {
  @override
  Future<void> run(UpdateLeadControllerArgs args) async {
    final repository = LeadRepository();
    final lead = await repository.updateLead(
      args.id,
      companyId: args.companyId,
      customerId: args.customerId,
      status: args.status,
    );

    print('Lead ${lead.id} updated successfully');
  }
}
