import 'package:flutter/material.dart';

class CounterState {
  int _value = 0;

  void increment() => _value++;

  void decremento() => _value--;

  int get value => _value;


  bool diff(CounterState old) {
    return old._value != _value;
  }

}

class CounterProvider extends InheritedWidget {
  final state = CounterState();

  CounterProvider({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(covariant CounterProvider oldWidget) {
    return oldWidget.state.diff(state);
  }
}
