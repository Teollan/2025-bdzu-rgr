import 'package:args/args.dart';
import 'package:rgr/core/input/argument/argument.dart';

class ArgumentSchema<T> {
  final Map<String, Argument<dynamic>> arguments;
  final T Function(Map<String, dynamic>) mapFn;

  ArgumentSchema(this.arguments, this.mapFn);

  T parse(ArgResults values) {
    final parsed = <String, dynamic>{};

    for (final entry in arguments.entries) {
      final name = entry.key;
      final argument = entry.value;

      final input = argument is Argument<bool>
          ? values.flag(name).toString()
          : values.option(name);

      final value = argument.parseAndValidate(input);

      parsed[name] = value;
    }

    return mapFn(parsed);
  }
}
