import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:simpe_state_management/domain/mobx/counter_state.dart';
import 'package:simpe_state_management/domain/mobx/list_state.dart';
import 'package:simpe_state_management/presentation/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = ProductsListStore();

  @override
  void initState() {
    super.initState();
    store.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CounterState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX'),
      ),
      body: Observer(
        builder: (context) {
          if (store.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: store.productsList.length,
                  itemBuilder: (context, index) {
                    return ProductCard(card: store.productsList[index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                    onPressed: state.clear,
                    child: Text('Товаров в корзине: ${state.value}')),
              )
            ],
          );
        },
      ),
    );
  }
}
