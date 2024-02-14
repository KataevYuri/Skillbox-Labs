import 'package:mobx/mobx.dart';
import 'package:simpe_state_management/domain/models/product.dart';
import 'package:simpe_state_management/domain/models/products_list.dart';
import 'package:simpe_state_management/domain/repositories/products_repository.dart';

part 'list_state.g.dart';

class ProductsListStore = _ProductsListStore with _$ProductsListStore;

abstract class _ProductsListStore with Store {
  @observable
  ProductsList productsList = [];

  @observable
  bool isLoading = false;

  @action
  Future getProducts() async {
    isLoading = true;

    productsList = await ProductsRepository().getProducts();

    isLoading = false;
  }
}
