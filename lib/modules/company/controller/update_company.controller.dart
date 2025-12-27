import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/company/model/company.repository.dart';
import 'package:rgr/modules/company/view/company.view.dart';

class Args {
  final int id;
  final String name;

  Args({required this.id, required this.name});
}

class UpdateCompanyController extends Controller<Args> {
  final companyRepository = CompanyRepository();

  @override
  Future<void> run(args) async {
    final existing = await companyRepository.findCompany(args.id);

    if (existing == null) {
      throw Exception('Company with id ${args.id} not found');
    }

    final company = await companyRepository.updateCompany(
      args.id,
      name: args.name,
    );

    print('Company updated successfully!');
    CompanyView.showCompany(company);
  }
}
