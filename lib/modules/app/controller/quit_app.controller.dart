import 'package:rgr/app/app.dart';
import 'package:rgr/core/controller/controller.dart';

class QuitAppController extends Controller<void> {
  @override
  Future<void> run(_) async {
    await App.quit();
  }
}
