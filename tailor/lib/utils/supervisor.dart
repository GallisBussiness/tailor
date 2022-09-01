import 'package:tailor/manager/manager.dart';

typedef ManagerFormula = Manager Function();

class Supervisor {
  final Map<dynamic, Manager> _store = {};
  final Map<dynamic, ManagerFormula> _formulas = {};

  Supervisor register<T extends Manager>(ManagerFormula formula) {
    _formulas[T] = formula;
    return this;
  }

  _fetch<T extends Manager>() => _store[T] = _formulas[T]!();

  T summon<T extends Manager>() =>
      _store.containsKey(T) ? _store[T] : _fetch<T>();

  release<T extends Manager>() {
    Manager manager = _store[T]!;
    manager.dispose();
    _store.remove(T);
  }
}
