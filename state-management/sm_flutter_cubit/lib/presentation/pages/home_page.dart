import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpe_state_management/domain/models/products_list.dart';
import 'package:simpe_state_management/domain/providers/sm_provider.dart';
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
  @override
  void initState() {
    super.initState();
    bloc = CounterInCartBloc();
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
                  child: BlocProvider<CounterInCartBloc>(
                    create: (context) => bloc,
                    child: BlocBuilder<CounterInCartBloc, int>(
                        builder: (context, state) => ElevatedButton(
                            onPressed: () =>
                                BlocProvider.of<CounterInCartBloc>(context)
                                    .onClear(),
                            child: Text('Товаров в корзине: $state'))),
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
