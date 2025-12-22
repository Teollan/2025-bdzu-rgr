import 'package:args/args.dart';
import 'package:args/command_runner.dart';

abstract class Argument<T> {
  T parse(String value);
}

class StringArgument extends Argument<String> {
  @override
  String parse(String value) {
    return value;
  }
}

class IntArgument extends Argument<int> {
  @override
  int parse(String value) {
    return int.parse(value);
  }
}

class TimeArgument extends Argument<DateTime> {
  @override
  DateTime parse(String value) {
    return DateTime.parse(value);
  }
}

class Arguments {
  final Map<String, Argument<dynamic>> arguments;
  late final ArgParser baseParser;

  Arguments(this.arguments, {List<String>? required}) {
    baseParser = ArgParser();

    runner = CommandRunner(executableName, description)

    for (final option in arguments) {
      baseParser.addCommand('')
    }
  }

  Map<String, dynamic> parse(String args) {}
}
