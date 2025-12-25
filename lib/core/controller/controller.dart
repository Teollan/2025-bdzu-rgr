abstract class Controller<T> {
  Controller();

  Future<void> run(T args);
}
