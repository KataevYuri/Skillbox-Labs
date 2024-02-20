import 'package:flutter/material.dart';
import 'package:simpe_state_management/domain/models/products_list.dart';
import 'package:simpe_state_management/domain/providers/sm_provider.dart';
import 'package:simpe_state_management/domain/repositories/products_repository.dart';

import 'package:simpe_state_management/presentation/widgets/product_card.dart';

late final CounterInCartBloc counterBloc;

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    counterBloc = CounterInCartBloc();
  }

  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Магазин барахла https://fakestoreapi.com/'),
      ),
      body: StreamBuilder<ProductsList>(
        stream: ProductsRepository().getProducts(),
        builder: (BuildContext context, AsyncSnapshot<ProductsList> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return ProductCard(card: snapshot.data![index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () =>
                        counterBloc.action.add(CounterInCartEven.clear),
                    child: StreamBuilder<int>(
                        stream: counterBloc.state,
                        builder: (context, snapshot) {
                          return Text(
                              'Товаров в корзине: ${snapshot.data ?? 0}');
                        }),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
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
          }
        },
      ),
    );
  }
}
