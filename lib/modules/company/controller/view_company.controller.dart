import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/company/model/company.repository.dart';
import 'package:rgr/modules/company/view/company.view.dart';

class Args {
  final int id;

  Args({required this.id});
}

class ViewCompanyController extends Controller<Args> {
  final companyRepository = CompanyRepository();

  @override
  Future<void> run(args) async {
    final company = await companyRepository.findCompany(args.id);

    if (company == null) {
      throw Exception('Company with id ${args.id} not found');
    }

    CompanyView.showCompany(company);
  }
}
