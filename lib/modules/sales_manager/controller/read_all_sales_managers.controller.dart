import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/sales_manager/model/sales_manager.repository.dart';
import 'package:rgr/modules/sales_manager/view/sales_manager.view.dart';

class ReadAllSalesManagersControllerArgs {
  final int limit;
  final int offset;

  ReadAllSalesManagersControllerArgs({
    required this.limit,
    required this.offset,
  });
}

class ReadAllSalesManagersController
    extends Controller<ReadAllSalesManagersControllerArgs> {
  final repository = SalesManagerRepository();

  @override
  Future<void> run(args) async {
    final salesManagers = await repository.getAllSalesManagers(
      limit: args.limit,
      offset: args.offset,
    );

    print('Sales managers found:');
    SalesManagerView.showSalesManagers(salesManagers);
  }
}
