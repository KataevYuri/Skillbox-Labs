import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterInCartEvent {}

class CounterInCartIncrementEvent extends CounterInCartEvent {}

class CounterInCartClearEvent extends CounterInCartEvent {}

class CounterInCartBloc extends Bloc<CounterInCartEvent, int> {
  CounterInCartBloc() : super(0) {
    on<CounterInCartIncrementEvent>(_onIncrement);
    on<CounterInCartClearEvent>(_onClear);
  }

  _onIncrement(CounterInCartIncrementEvent event, Emitter<int> emit) {
    emit(state + 1);
  }

  _onClear(CounterInCartClearEvent event, Emitter<int> emit) {
    emit(0);
  }
}
