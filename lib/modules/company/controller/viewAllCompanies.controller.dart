import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/modules/company/model/company.repository.dart';
import 'package:rgr/modules/company/view/company.view.dart';

class ViewAllCompaniesController extends Controller {
  final companyRepository = CompanyRepository();

  ViewAllCompaniesController() : super(Arguments({}));

  @override
  Future<void> run(_) async {
    final companies = await companyRepository.findAllCompanies();

    CompanyView.showCompanies(companies);
  }
}
