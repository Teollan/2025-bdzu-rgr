import 'package:rgr/core/input/parser/parser.dart';

class DateTimeParser extends Parser<DateTime> {
  @override
  DateTime parse(String value) => DateTime.parse(value);

  @override
  DateTime? tryParse(String value) => DateTime.tryParse(value);
}
