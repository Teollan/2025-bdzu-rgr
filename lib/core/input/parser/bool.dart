import 'package:rgr/core/input/parser/parser.dart';

class BoolParser extends Parser<bool> {
  @override
  bool parse(String value) => bool.parse(value);

  @override
  bool? tryParse(String value) => bool.tryParse(value);
}
