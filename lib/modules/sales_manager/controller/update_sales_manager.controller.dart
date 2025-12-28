import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/sales_manager/model/sales_manager.repository.dart';
import 'package:rgr/modules/sales_manager/view/sales_manager.view.dart';

class UpdateSalesManagerControllerArgs {
  final int id;
  final int? companyId;
  final String? firstName;
  final String? lastName;

  UpdateSalesManagerControllerArgs({
    required this.id,
    this.companyId,
    this.firstName,
    this.lastName,
  });
}

class UpdateSalesManagerController
    extends Controller<UpdateSalesManagerControllerArgs> {
  final repository = SalesManagerRepository();

  @override
  Future<void> run(args) async {
    final existing = await repository.findSalesManagerById(args.id);

    if (existing == null) {
      throw Exception('Sales manager with id ${args.id} not found');
    }

    final salesManager = await repository.updateSalesManager(
      args.id,
      companyId: args.companyId,
      firstName: args.firstName,
      lastName: args.lastName,
    );

    print('Sales manager updated successfully!');
    SalesManagerView.showSalesManager(salesManager);
  }
}
