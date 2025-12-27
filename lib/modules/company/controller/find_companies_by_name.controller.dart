import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/company/model/company.repository.dart';
import 'package:rgr/modules/company/view/company.view.dart';

class FindCompaniesByNameControllerArgs {
  final String name;

  FindCompaniesByNameControllerArgs({required this.name});
}

typedef Args = FindCompaniesByNameControllerArgs;

class FindCompaniesByNameController extends Controller<Args> {
  final companyRepository = CompanyRepository();

  @override
  Future<void> run(args) async {
    final companies = await companyRepository.findCompaniesByName(args.name);

    print('Companies found:');
    CompanyView.showCompanies(companies);
  }
}
