import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:simpe_state_management/domain/redux/action.dart';
import 'package:simpe_state_management/domain/redux/app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(GetProductsListAction());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redux'),
      ),
      body: Column(children: [
        Expanded(
          child: StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (context, vm) => vm.plist,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () => store.dispatch(ClearEvent()),
                    child: Text('Товаров в корзине: ${state.countInCart}'));
              }),
        )
      ]),
    );
  }
}
