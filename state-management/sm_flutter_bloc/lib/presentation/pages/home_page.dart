import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpe_state_management/domain/blocs/products_list_bloc/products_list_bloc.dart';
import 'package:simpe_state_management/domain/blocs/counter_bloc/counter_bloc.dart';
import 'package:simpe_state_management/domain/repositories/products_repository.dart';

import 'package:simpe_state_management/presentation/widgets/product_card.dart';

late CounterInCartBloc bloc;

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _productsListBloc = ProductsListBloc(ProductsRepository());

  @override
  void initState() {
    super.initState();
    bloc = CounterInCartBloc();
    _productsListBloc.add(LoadProductsList());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Магазин барахла https://fakestoreapi.com/'),
      ),
      body: BlocBuilder<ProductsListBloc, ProductsListState>(
        bloc: _productsListBloc,
        builder: (context, state) {
          if (state is ProductsListLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.productsList.length,
                    itemBuilder: (context, index) {
                      return ProductCard(card: state.productsList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: BlocProvider<CounterInCartBloc>(
                    create: (context) => bloc,
                    child: BlocBuilder<CounterInCartBloc, int>(
                        builder: (context, state) => ElevatedButton(
                            onPressed: () =>
                                bloc.add(CounterInCartClearEvent()),
                            child: Text('Товаров в корзине: $state'))),
                  ),
                ),
              ],
            );
          } else if (state is ProductsListLoadingError) {
            return Text(state.exception.toString());
          }
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Загрузка данных...'),
                SizedBox(height: 10),
                CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }
}
