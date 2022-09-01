import 'package:flutter/material.dart';
import 'package:tailor/utils/supervisor.dart';

class Provider extends InheritedWidget {
  const Provider({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  final Supervisor data;

  static Supervisor of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Provider>()!.data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
