import 'package:rgr/core/controller/controller.dart';
import 'package:rgr/core/input/argument/argument.dart';
import 'package:rgr/modules/company/model/company.repository.dart';
import 'package:rgr/modules/company/view/company.view.dart';

class ViewCompanyByIdController extends Controller {
  final companyRepository = CompanyRepository();

  ViewCompanyByIdController()
    : super(Arguments({'id': IntArgument()}, required: ['id']));

  @override
  Future<void> run(args) async {
    final companyId = args['id'] as int;

    final company = await companyRepository.findCompany(companyId);

    if (company == null) {
      throw Error();
    }

    CompanyView.showCompany(company);
  }
}
