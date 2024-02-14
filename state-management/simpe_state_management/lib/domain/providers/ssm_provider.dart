import 'package:flutter/material.dart';

class CounterInCart with ChangeNotifier {
  int value = 0;

  void increment() {
    value++;
    notifyListeners();
  }

  void clear() {
    value = 0;
    notifyListeners();
  }
}
