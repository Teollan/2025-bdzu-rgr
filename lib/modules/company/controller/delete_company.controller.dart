import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/company/model/company.repository.dart';
import 'package:rgr/modules/company/view/company.view.dart';

class Args {
  final int id;

  Args({required this.id});
}

class DeleteCompanyController extends Controller<Args> {
  final companyRepository = CompanyRepository();

  @override
  Future<void> run(args) async {
    final existing = await companyRepository.findCompany(args.id);

    if (existing == null) {
      throw Exception('Company with id ${args.id} not found');
    }

    final company = await companyRepository.deleteCompany(args.id);

    print('Company deleted successfully!');
    CompanyView.showCompany(company);
  }
}
