import 'package:mobx/mobx.dart';

part 'counter_state.g.dart';

class CounterState = _CounterState with _$CounterState;

abstract class _CounterState with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void clear() {
    value = 0;
  }
}
