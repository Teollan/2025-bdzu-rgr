import 'package:rgr/core/output/table.dart';
import 'package:rgr/modules/sales_manager/model/sales_manager.entity.dart';

class SalesManagerView {
  static void showSalesManager(SalesManager salesManager) {
    final Map<String, dynamic> map = {
      'id': salesManager.id,
      'company_id': salesManager.companyId,
      'first_name': salesManager.firstName,
      'last_name': salesManager.lastName,
    };

    final table = ColumnValueTable();

    print(table.build(map.entries));
  }

  static void showSalesManagers(List<SalesManager> salesManagers) {
    final table = Table<SalesManager>(
      columns: {
        'id': (s) => s.id,
        'company_id': (s) => s.companyId,
        'first_name': (s) => s.firstName,
        'last_name': (s) => s.lastName,
      },
    );

    print(table.build(salesManagers));
  }
}
