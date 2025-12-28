import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/sales_manager/model/sales_manager.repository.dart';
import 'package:rgr/modules/sales_manager/view/sales_manager.view.dart';

class ReadOneSalesManagerControllerArgs {
  final int id;

  ReadOneSalesManagerControllerArgs({required this.id});
}

class ReadOneSalesManagerController
    extends Controller<ReadOneSalesManagerControllerArgs> {
  final repository = SalesManagerRepository();

  @override
  Future<void> run(args) async {
    final salesManager = await repository.findSalesManagerById(args.id);

    if (salesManager == null) {
      throw Exception('Sales manager with id ${args.id} not found');
    }

    print('Sales manager found:');
    SalesManagerView.showSalesManager(salesManager);
  }
}
