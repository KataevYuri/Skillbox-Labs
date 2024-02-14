import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpe_state_management/domain/providers/ssm_provider.dart';

import '../../domain/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.card,
  });

  final Product card;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        selectedTileColor: Colors.amber,
        onTap: () => context.read<CounterInCart>().increment(),
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
