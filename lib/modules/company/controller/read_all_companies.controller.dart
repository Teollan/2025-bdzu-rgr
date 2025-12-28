import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/modules/company/model/company.repository.dart';
import 'package:rgr/modules/company/view/company.view.dart';

class ReadAllCompaniesControllerArgs {
  final int limit;
  final int offset;

  ReadAllCompaniesControllerArgs({required this.limit, required this.offset});
}

class ReadAllCompaniesController
    extends Controller<ReadAllCompaniesControllerArgs> {
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
