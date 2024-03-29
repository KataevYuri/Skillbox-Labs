part of 'products_list_bloc.dart';

class ProductsListState {}

class ProductsListInitial extends ProductsListState {}

class ProductsListLoading extends ProductsListState {}

class ProductsListLoaded extends ProductsListState {
  final ProductsList productsList;

  ProductsListLoaded({
    required this.productsList,
  });
}

class ProductsListLoadingError extends ProductsListState {
  final Object? exception;
  ProductsListLoadingError({
    this.exception,
  });
}
