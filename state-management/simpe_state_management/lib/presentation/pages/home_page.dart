import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simpe_state_management/domain/models/products_list.dart';
import 'package:simpe_state_management/domain/providers/ssm_provider.dart';
import 'package:simpe_state_management/domain/repositories/products_repository.dart';
import 'package:simpe_state_management/presentation/widgets/product_card.dart';

ProductsList pl = [];

Future getData() async {
  pl = await ProductsRepository().getProducts();
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Магазин барахла https://fakestoreapi.com/'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (
          context,
          snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
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
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: pl.length,
                    itemBuilder: (context, index) {
                      return ProductCard(card: pl[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () => context.read<CounterInCart>().clear(),
                    child: Consumer<CounterInCart>(
                      builder: (context, state, child) =>
                          Text('Товаров в корзине: ${state.value}'),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Text('error');
          }
        },
      ),
    );
  }
}
