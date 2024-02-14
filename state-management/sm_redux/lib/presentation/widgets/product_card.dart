import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:simpe_state_management/domain/redux/action.dart';
import 'package:simpe_state_management/domain/redux/app_state.dart';

import '../../domain/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.card,
  });

  final Product card;

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Card(
            elevation: 3,
            child: ListTile(
              selectedTileColor: Colors.amber,
              onTap: () => store.dispatch(IncrementEvent()),
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
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                    fontSize: 18),
              ),
            ),
          );
        });
  }
}
