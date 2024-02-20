import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:simpe_state_management/domain/repositories/products_repository.dart';

import '../../presentation/widgets/product_card.dart';
import 'action.dart';
import 'app_state.dart';

void loaderMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher nextDispatcher) {
  if (action is GetProductsListAction) {
    ProductsRepository()
        .getProducts()
        .then((items) => store.dispatch(LoadedProductsListAction(
              ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ProductCard(card: items[index]);
                },
              ),
            )));
  }

  nextDispatcher(action);
}
