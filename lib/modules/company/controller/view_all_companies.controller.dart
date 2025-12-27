import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/company/model/company.repository.dart';
import 'package:rgr/modules/company/view/company.view.dart';

class ViewAllCompaniesControllerArgs {
  final int limit;
  final int offset;

  ViewAllCompaniesControllerArgs({required this.limit, required this.offset});
}

class ViewAllCompaniesController
    extends Controller<ViewAllCompaniesControllerArgs> {
  final companyRepository = CompanyRepository();

  @override
  Future<void> run(args) async {
    final companies = await companyRepository.getAllCompanies(
      limit: args.limit,
      offset: args.offset,
    );

    print('Companies found:');
    CompanyView.showCompanies(companies);
  }
}
