import 'package:simpe_state_management/data/get_products_dio.dart';
import 'package:simpe_state_management/domain/models/products_list.dart';

class ProductsRepository {
  Stream<ProductsList> getProducts() {
    return ProductsDIOData().getProductsData();
  }
}
