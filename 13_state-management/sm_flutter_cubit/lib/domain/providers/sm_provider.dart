import 'package:flutter_bloc/flutter_bloc.dart';

class CounterInCartBloc extends Cubit<int> {
  CounterInCartBloc() : super(0);

  onIncrement() {
    emit(state + 1);
  }

  onClear() {
    emit(0);
  }
}
