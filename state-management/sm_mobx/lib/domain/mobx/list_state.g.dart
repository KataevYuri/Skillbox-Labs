// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductsListStore on _ProductsListStore, Store {
  late final _$productsListAtom =
      Atom(name: '_ProductsListStore.productsList', context: context);

  @override
  List<Product> get productsList {
    _$productsListAtom.reportRead();
    return super.productsList;
  }

  @override
  set productsList(List<Product> value) {
    _$productsListAtom.reportWrite(value, super.productsList, () {
      super.productsList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ProductsListStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getProductsAsyncAction =
      AsyncAction('_ProductsListStore.getProducts', context: context);

  @override
  Future<dynamic> getProducts() {
    return _$getProductsAsyncAction.run(() => super.getProducts());
  }

  @override
  String toString() {
    return '''
productsList: ${productsList},
isLoading: ${isLoading}
    ''';
  }
}
