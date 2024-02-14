import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpe_state_management/domain/blocs/counter_bloc/counter_bloc.dart';
import 'package:simpe_state_management/domain/models/product.dart';
import 'package:simpe_state_management/presentation/pages/home_page.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.card,
  });

  final Product card;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterInCartBloc>(
      create: (context) => bloc,
      child: BlocBuilder<CounterInCartBloc, int>(
        builder: (context, state) => Card(
          elevation: 3,
          child: ListTile(
            selectedTileColor: Colors.amber,
            onTap: () => bloc.add(CounterInCartIncrementEvent()),
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
        ),
      ),
    );
  }
}
