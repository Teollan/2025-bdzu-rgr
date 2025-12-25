import 'package:rgr/core/input/parser/parser.dart';

class DoubleParser extends Parser<double> {
  @override
  double parse(String value) => double.parse(value);

  @override
  double? tryParse(String value) => double.tryParse(value);
}
