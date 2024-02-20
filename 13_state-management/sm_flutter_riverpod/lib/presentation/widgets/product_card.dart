import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simpe_state_management/domain/providers/sm_provider.dart';

import '../../domain/models/product.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({
    super.key,
    required this.card,
  });

  final Product card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(counterInCartProvider.notifier);
    return Card(
      elevation: 3,
      child: ListTile(
        selectedTileColor: Colors.amber,
        onTap: () => provider.increment(),
        selectedColor: Colors.blue,
        leading: Image.network(
          card.imageUrl,
          width: 100,
        ),
        trailing: const Icon(Icons.shopping_bag),
        title: Text(card.title),
        subtitle: Text(
          'Цена: ${card.price}',
          style: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.w900, fontSize: 18),
        ),
      ),
    );
  }
}
