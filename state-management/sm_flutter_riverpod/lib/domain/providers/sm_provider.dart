import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simpe_state_management/domain/models/products_list.dart';
import 'package:simpe_state_management/domain/repositories/products_repository.dart';

final counterInCartProvider =
    StateNotifierProvider<CounterInCart, int>((_) => CounterInCart());

class CounterInCart extends StateNotifier<int> {
  CounterInCart() : super(0);

  void increment() {
    state++;
  }

  void clear() => state = 0;
}

final configProvider = FutureProvider<ProductsList>(
    (ref) async => await ProductsRepository().getProducts());
