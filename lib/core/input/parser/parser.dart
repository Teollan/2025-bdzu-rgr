abstract class Parser<T> {
  T parse(String value);

  T? tryParse(String value) {
    try {
      return parse(value);
    } catch (_) {
      return null;
    }
  }
}
