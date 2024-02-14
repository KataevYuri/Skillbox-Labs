import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpe_state_management/domain/models/products_list.dart';
import 'package:simpe_state_management/domain/repositories/products_repository.dart';

part 'products_list_event.dart';
part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsListBloc(this.productsRepository) : super(ProductsListInitial()) {
    on<LoadProductsList>((event, emit) async {
      try {
        final productsList = await productsRepository.getProducts();
        emit(ProductsListLoaded(productsList: productsList));
      } catch (e) {
        emit(ProductsListLoadingError(exception: e));
      }
    });
  }

  final ProductsRepository productsRepository;
}
