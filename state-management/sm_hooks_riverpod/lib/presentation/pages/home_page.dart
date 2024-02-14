import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simpe_state_management/domain/models/products_list.dart';
import 'package:simpe_state_management/domain/providers/sm_provider.dart';

import 'package:simpe_state_management/presentation/widgets/product_card.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterInCartProvider);
    final provider = ref.watch(counterInCartProvider.notifier);
    AsyncValue<ProductsList> config = ref.watch(configProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Магазин барахла https://fakestoreapi.com/'),
      ),
      body: config.when(
          loading: () => const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Загрузка данных...'),
                    SizedBox(height: 10),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
          data: (config) => Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: config.length,
                      itemBuilder: (context, index) {
                        return ProductCard(card: config[index]);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () => provider.clear(),
                      child: Text('Товаров в корзине: $count'),
                    ),
                  ),
                ],
              ),
          error: (err, stack) => Text('Error: $err')),
    );
  }
}
