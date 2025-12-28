import 'package:rgr/core/output/table.dart';
import 'package:rgr/modules/company/model/company.entity.dart';

class CompanyView {
  static void showCompany(Company company) {
    final Map<String, dynamic> companyMap = {
      'id': company.id,
      'name': company.name,
    };

    final table = ColumnValueTable();

    print(table.build(companyMap.entries));
  }

  static void showCompanies(List<Company> companies) {
    final table = Table<Company>(
      columns: {'id': (c) => c.id, 'name': (c) => c.name},
    );

    print(table.build(companies));
  }
}
