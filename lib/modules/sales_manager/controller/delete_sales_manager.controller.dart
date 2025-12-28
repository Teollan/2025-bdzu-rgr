import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/sales_manager/model/sales_manager.repository.dart';
import 'package:rgr/modules/sales_manager/view/sales_manager.view.dart';

class DeleteSalesManagerControllerArgs {
  final int id;

  DeleteSalesManagerControllerArgs({required this.id});
}

class DeleteSalesManagerController
    extends Controller<DeleteSalesManagerControllerArgs> {
  final repository = SalesManagerRepository();

  @override
  Future<void> run(args) async {
    final existing = await repository.findSalesManagerById(args.id);

    if (existing == null) {
      throw Exception('Sales manager with id ${args.id} not found');
    }

    final salesManager = await repository.deleteSalesManager(args.id);

    print('Sales manager deleted successfully!');
    SalesManagerView.showSalesManager(salesManager);
  }
}
