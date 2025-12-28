import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/company/model/company.repository.dart';
import 'package:rgr/modules/company/view/company.view.dart';

class ReadOneCompanyControllerArgs {
  final int id;

  ReadOneCompanyControllerArgs({required this.id});
}

class ReadOneCompanyController
    extends Controller<ReadOneCompanyControllerArgs> {
  final companyRepository = CompanyRepository();

  @override
  Future<void> run(args) async {
    final company = await companyRepository.findCompanyById(args.id);

    if (company == null) {
      throw Exception('Company with id ${args.id} not found');
    }

    print('Company found:');
    CompanyView.showCompany(company);
  }
}
