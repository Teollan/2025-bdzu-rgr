import 'package:rgr/core/input/parser/bool.dart';
import 'package:rgr/core/input/parser/datetime.dart';
import 'package:rgr/core/input/parser/double.dart';
import 'package:rgr/core/input/parser/int.dart';
import 'package:rgr/core/input/parser/parser.dart';
import 'package:rgr/core/input/parser/string.dart';

class Argument<T> {
  final Parser<T> parser;
  final T? defaultValue;
  final bool isRequired;
  final String? name;
  final String? help;

  Argument({
    required this.parser,
    this.defaultValue,
    this.isRequired = false,
    this.name,
    this.help,
  });

  static Argument<String> string({
    String? defaultValue,
    bool isRequired = false,
    String? name,
    String? help,
  }) => Argument(
    parser: StringParser(),
    defaultValue: defaultValue,
    isRequired: isRequired,
    name: name,
    help: help,
  );

  static Argument<int> integer({
    int? defaultValue,
    bool isRequired = false,
    String? name,
    String? help,
  }) => Argument(
    parser: IntParser(),
    defaultValue: defaultValue,
    isRequired: isRequired,
    name: name,
    help: help,
  );

  static Argument<double> floating({
    double? defaultValue,
    bool isRequired = false,
    String? name,
    String? help,
  }) => Argument(
    parser: DoubleParser(),
    defaultValue: defaultValue,
    isRequired: isRequired,
    name: name,
    help: help,
  );

  static Argument<DateTime> dateTime({
    DateTime? defaultValue,
    bool isRequired = false,
    String? name,
    String? help,
  }) => Argument(
    parser: DateTimeParser(),
    defaultValue: defaultValue,
    isRequired: isRequired,
    name: name,
    help: help,
  );

  static Argument<bool> flag({
    bool defaultValue = false,
    String? name,
    String? help,
  }) => Argument(
    parser: BoolParser(),
    defaultValue: defaultValue,
    isRequired: false,
    name: name,
    help: help,
  );

  T? parseAndValidate(String? value) {
    final parsedValue = parse(value);

    validate(parsedValue);

    return parsedValue;
  }

  T? parse(String? value) {
    if (value == null) {
      return defaultValue;
    }

    return parser.parse(value);
  }

  void validate(T? value) {
    if (isRequired && value == null) {
      throw ArgumentError('The argument $name is required.');
    }
  }
}
