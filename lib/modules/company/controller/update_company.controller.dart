import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/company/model/company.repository.dart';
import 'package:rgr/modules/company/view/company.view.dart';

class UpdateCompanyControllerArgs {
  final int id;
  final String name;

  UpdateCompanyControllerArgs({required this.id, required this.name});
}

class UpdateCompanyController extends Controller<UpdateCompanyControllerArgs> {
  final companyRepository = CompanyRepository();

  @override
  Future<void> run(args) async {
    final existing = await companyRepository.findCompanyById(args.id);

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
