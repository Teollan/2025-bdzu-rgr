import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/company/model/company.repository.dart';
import 'package:rgr/modules/company/view/company.view.dart';

class CreateCompanyControllerArgs {
  final String name;

  CreateCompanyControllerArgs({required this.name});
}

class CreateCompanyController extends Controller<CreateCompanyControllerArgs> {
  final companyRepository = CompanyRepository();

  @override
  Future<void> run(args) async {
    final company = await companyRepository.createCompany(name: args.name);

    print('Company created successfully!');
    CompanyView.showCompany(company);
  }
}
