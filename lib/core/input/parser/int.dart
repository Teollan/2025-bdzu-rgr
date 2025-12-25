import 'package:rgr/core/input/parser/parser.dart';

class IntParser extends Parser<int> {
  @override
  int parse(String value) => int.parse(value);

  @override
  int? tryParse(String value) => int.tryParse(value);
}
