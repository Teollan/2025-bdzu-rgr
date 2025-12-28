import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/sales_manager/model/sales_manager.repository.dart';
import 'package:rgr/modules/sales_manager/view/sales_manager.view.dart';

class CreateSalesManagerControllerArgs {
  final int companyId;
  final String firstName;
  final String lastName;

  CreateSalesManagerControllerArgs({
    required this.companyId,
    required this.firstName,
    required this.lastName,
  });
}

class CreateSalesManagerController
    extends Controller<CreateSalesManagerControllerArgs> {
  final repository = SalesManagerRepository();

  @override
  Future<void> run(args) async {
    final salesManager = await repository.createSalesManager(
      companyId: args.companyId,
      firstName: args.firstName,
      lastName: args.lastName,
    );

    print('Sales manager created successfully!');
    SalesManagerView.showSalesManager(salesManager);
  }
}
