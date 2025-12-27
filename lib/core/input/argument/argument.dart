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
  final String name;
  final String? help;

  Argument({
    required this.name,
    required this.parser,
    this.defaultValue,
    this.isRequired = false,
    this.help,
  });

  static Argument<String> string({
    required String name,
    String? defaultValue,
    bool isRequired = false,
    String? help,
  }) => Argument(
    name: name,
    parser: StringParser(),
    defaultValue: defaultValue,
    isRequired: isRequired,
    help: help,
  );

  static Argument<int> integer({
    required String name,
    int? defaultValue,
    bool isRequired = false,
    String? help,
  }) => Argument(
    name: name,
    parser: IntParser(),
    defaultValue: defaultValue,
    isRequired: isRequired,
    help: help,
  );

  static Argument<double> floating({
    required String name,
    double? defaultValue,
    bool isRequired = false,
    String? help,
  }) => Argument(
    name: name,
    parser: DoubleParser(),
    defaultValue: defaultValue,
    isRequired: isRequired,
    help: help,
  );

  static Argument<DateTime> dateTime({
    required String name,
    DateTime? defaultValue,
    bool isRequired = false,
    String? help,
  }) => Argument(
    name: name,
    parser: DateTimeParser(),
    defaultValue: defaultValue,
    isRequired: isRequired,
    help: help,
  );

  static Argument<bool> flag({
    required String name,
    bool defaultValue = false,
    String? help,
  }) => Argument(
    name: name,
    parser: BoolParser(),
    defaultValue: defaultValue,
    isRequired: false,
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
