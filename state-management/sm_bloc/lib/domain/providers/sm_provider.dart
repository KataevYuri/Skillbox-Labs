import 'dart:async';

enum CounterInCartEven { increase, clear }

class CounterInCartBloc {
  int value = 0;

  final _stateController = StreamController<int>();
  final _eventsController = StreamController<CounterInCartEven>();

  Stream<int> get state => _stateController.stream;
  Sink<CounterInCartEven> get action => _eventsController.sink;

  CounterInCartBloc() {
    value = 0;
    _eventsController.stream.listen(_handleEvent);
  }

  void dispose() {
    _stateController.close();
    _eventsController.close();
  }

  void _handleEvent(CounterInCartEven action) async {
    if (action == CounterInCartEven.increase) {
      value++;
    } else if (action == CounterInCartEven.clear) {
      value = 0;
    }
    _stateController.add(value);
  }
}
