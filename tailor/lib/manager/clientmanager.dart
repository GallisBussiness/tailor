import 'package:rxdart/subjects.dart';
import 'package:tailor/manager/manager.dart';

class ClientManager extends Manager {
  final BehaviorSubject<String> _searchSubject =
      BehaviorSubject<String>.seeded("");

  Stream<String> get search$ => _searchSubject.stream;

  Sink<String> get inSearch => _searchSubject.sink;

  ClientManager() {
    _searchSubject.listen((value) {
      print(value);
    });
  }

  @override
  void dispose() {
    _searchSubject.close();
  }
}
